{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.dconf-editor
    celluloid
    fragments
    gnomeExtensions.caffeine
    pdfarranger
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome.totem
    gnome.gnome-music
    gnome.gnome-maps
    gnome.epiphany
    xterm
  ];
}
