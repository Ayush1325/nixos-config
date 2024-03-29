# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."luks-1d78d62b-3fac-4774-a9aa-d50decd365b6".device = "/dev/disk/by-uuid/1d78d62b-3fac-4774-a9aa-d50decd365b6";

  # Pretty boot
  boot.plymouth.enable = true;
  boot.initrd.systemd.enable = true;
  boot.kernelParams = [ "quiet" ];

  # Primary SSD
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/1f4286f3-884d-4ce0-b8b3-a6246fb05c64";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "noatime" "defaults" "ssd" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/1f4286f3-884d-4ce0-b8b3-a6246fb05c64";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" "defaults" "ssd" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/1f4286f3-884d-4ce0-b8b3-a6246fb05c64";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" "defaults" "ssd" ];
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/1f4286f3-884d-4ce0-b8b3-a6246fb05c64";
      fsType = "btrfs";
      options = [ "subvol=@persist" "compress=zstd" "noatime" "defaults" "ssd" ];
    };
    "/var/log" = {
      device = "/dev/disk/by-uuid/1f4286f3-884d-4ce0-b8b3-a6246fb05c64";
      fsType = "btrfs";
      options = [ "subvol=@log" "compress=zstd" "noatime" "defaults" "ssd" ];
    };
    "/swap" = {
      device = "/dev/disk/by-uuid/1f4286f3-884d-4ce0-b8b3-a6246fb05c64";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/4326-687E";
      fsType = "vfat";
    };
  };

  # Secondary SSD
  fileSystems = {
    "/home/ayush/Documents/Programming" = {
      device = "/dev/disk/by-uuid/33cfe877-81a9-4aa4-8376-a0b6f62f5c50";
      fsType = "btrfs";
      options = [ "subvol=@programming" "defaults" "compress=zstd" "noatime" "ssd" "nofail" ];
    };
    "/home/ayush/Documents/University" = {
      device = "/dev/disk/by-uuid/33cfe877-81a9-4aa4-8376-a0b6f62f5c50";
      fsType = "btrfs";
      options = [ "subvol=@university" "defaults" "compress=zstd" "noatime" "ssd" "nofail" ];
    };
    "/home/ayush/Games" = {
      device = "/dev/disk/by-uuid/33cfe877-81a9-4aa4-8376-a0b6f62f5c50";
      fsType = "btrfs";
      options = [ "subvol=@games" "defaults" "compress=zstd" "noatime" "ssd" "nofail" ];
    };
    "/home/ayush/Videos/Movies" = {
      device = "/dev/disk/by-uuid/33cfe877-81a9-4aa4-8376-a0b6f62f5c50";
      fsType = "btrfs";
      options = [ "subvol=@media/movies" "defaults" "compress=zstd" "noatime" "ssd" "nofail" ];
    };
    "/home/ayush/Videos/Series" = {
      device = "/dev/disk/by-uuid/33cfe877-81a9-4aa4-8376-a0b6f62f5c50";
      fsType = "btrfs";
      options = [ "subvol=@media/series" "defaults" "compress=zstd" "noatime" "ssd" "nofail" ];
    };
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 8 * 1024;
  }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
