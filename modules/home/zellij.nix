{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      copy_command = "wl-copy";
      default_layout = "compact";
    };
  };

	home.packages = with pkgs; [
		wl-clipboard
	];
}
