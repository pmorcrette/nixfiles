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
        { name = "greymd/docker-zsh-completion"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "none9632/zsh-sudo"; }
        { name = "anatolykopyl/sshukh"; }
        { name = "BreakingPitt/zsh-packer"; }
        { name = "sparsick/ansible-zsh"; }
        { name = "se-jaeger/zsh-activate-py-environment"; }
        { name = "larkery/zsh-histdb"; }
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
