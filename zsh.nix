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

    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
    ];
    zplug = {
      enable = true;
      plugins = [
        { name = "greymd/docker-zsh-completion"; }
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
