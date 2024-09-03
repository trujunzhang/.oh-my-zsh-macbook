{ config, lib, pkgs, ... }:

let inherit (lib) mkIf elem; in

{
  home.sessionVariables = {
    GITHUB_TOKEN = "op://Personal/GitHub Personal Access Token/credential";
  };

  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://nix-community.github.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = {
    style = "plain";
  };

  # Btop, a fancy version of `top`.
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.btop.enable
  programs.btop.enable = true;

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://nix-community.github.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # SSH
  # https://nix-community.github.io/home-manager/options.html#opt-programs.ssh.enable
  # Some options also set in `../darwin/homebrew.nix`.
  programs.ssh.enable = true;
  programs.ssh.controlPath = "~/.ssh/%C"; # ensures the path is unique but also fixed length

  # Zoxide, a faster way to navigate the filesystem
  # https://github.com/ajeetdsouza/zoxide
  # https://nix-community.github.io/home-manager/options.html#opt-programs.zoxide.enable
  programs.zoxide.enable = true;

  # Zsh
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enable
  programs.zsh.enable = true;
  programs.zsh.dotDir = ".config/zsh";
  programs.zsh.history.path = "${config.xdg.stateHome}/zsh_history";

  home.packages = lib.attrValues ({
    # Some basics
    inherit (pkgs)
      abduco # lightweight session management
      bandwhich # display current network utilization by process
      bottom # fancy version of `top` with ASCII graphs
      browsh # in terminal browser
      coreutils
      curl
      du-dust # fancy version of `du`
      eza # fancy version of `ls`
      fd # fancy version of `find`
      hyperfine # benchmarking tool
      mosh # wrapper for `ssh` that better and not dropping connections
      parallel # runs commands in parallel
      ripgrep # better version of `grep`
      tealdeer # rust implementation of `tldr`
      thefuck
      unrar # extract RAR archives
      upterm # secure terminal sharing
      wget
      zellij
      yabai
      skhd
      xz # extract XZ archives
      vscode
      neovim
      alacritty
      # wezterm
      ;

    # Dev stuff
    inherit (pkgs)
      cloc # source code line counter
      deno
      github-copilot-cli
      google-cloud-sdk
      # idris2
      jq
      # nodejs
      s3cmd
      stack
      typescript
      ;
    inherit (pkgs.haskellPackages)
      cabal-install
      hoogle
      hpack
      implicit-hie
      ;
    agda = pkgs.agda.withPackages (ps: [ ps.standard-library ]);

    # Useful nix related tools
    inherit (pkgs)
      cachix # adding/managing alternative binary caches hosted by Cachix
      comma # run software from without installing it
      nix-output-monitor # get additional information while building packages
      nix-tree # interactively browse dependency graphs of Nix derivations
      nix-update # swiss-knife for updating nix packages
      nixpkgs-review # review pull-requests on nixpkgs
      node2nix # generate Nix expressions to build NPM packages
      statix # lints and suggestions for the Nix programming language
      ;

  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    inherit (pkgs)
      m-cli # useful macOS CLI commands
      # prefmanager # tool for working with macOS defaults
      ;
  });
}
