# See https://github.com/nix-community/home-manager/issues/4314 for info about why it needs to be installed as system package
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # Controllers
  hardware.steam-hardware.enable = true;
}
