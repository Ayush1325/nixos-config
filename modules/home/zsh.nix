{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = "[[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}";

    history = {
      share = false;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };
}
