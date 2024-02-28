{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rclone
  ];

  # TODO: Fix Systemd Service

  # systemd.user.services = {
  #   rclone-university = {
  #     Unit = {
  #       Description = "University Files Sync";
  #     };

  #     Service = {
  #       Type = "oneshot";
  #       ExecStart = "${pkgs.rclone}/bin/rclone bisync -P -v --resync --config=/home/ayush/.config/rclone/rclone.conf PersonalDrive:University\\ Material/ /home/ayush/Documents/University/";
  #     };
  #   };
  # };
}
