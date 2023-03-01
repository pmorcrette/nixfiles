{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ip = "ip --color=auto";
      e = "emacsclient";
      ls = "exa";
    };

    initExtra = ''
     eval $(starship init zsh)
     . "$HOME/.cargo/env"
     PATH=$PATH:~/.local/bin
     TERM=xterm
     source ~/.zfunc/_awsh
                              '';
    zplug = {
      enable = true;
      plugins = [
        { name = "greymd/docker-zsh-completion"; } #Docker autocompletion
        { name = "zsh-users/zsh-syntax-highlighting"; } # Syntax Highlighting in CLI
        { name = "none9632/zsh-sudo"; } # To append sude whenever I input ESC-ESC
        { name = "anatolykopyl/sshukh"; } #Can validate known_host key change
        { name = "BreakingPitt/zsh-packer"; } #packer autocomplete
        { name = "sparsick/ansible-zsh"; } # ansible autocomplete
        { name = "se-jaeger/zsh-activate-py-environment"; } # Activete python venv automatically
        { name = "larkery/zsh-histdb"; } # history as sqlite db
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
