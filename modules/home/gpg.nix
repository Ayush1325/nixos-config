{ ... }:

{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gpg = {
    enable = true;
  };
}
