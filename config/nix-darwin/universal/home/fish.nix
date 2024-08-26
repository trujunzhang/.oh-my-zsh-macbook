{ config, lib, pkgs, ... }:

let
  inherit (lib) elem optionalString;
  inherit (config.home.user-info) nixConfigDirectory;
in

{
  # Fish Shell
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.fish.enable
  programs.fish.enable = true;

  # Add Fish plugins
  home.packages = [
    # Automatically receive notifications when long processes finish
    pkgs.fishPlugins.done
    pkgs.fishPlugins.z
    pkgs.fishPlugins.fzf
    pkgs.fishPlugins.bass
    pkgs.fishPlugins.github-copilot-cli-fish
    # fish theme
    pkgs.fishPlugins.bobthefish
  ];

  # Fish functions ----------------------------------------------------------------------------- {{{

  programs.fish.functions = {

    # Set `$term_background` based on whether macOS is light or dark mode. Other Fish functions
    # trigger when this variable changes. We use a universal variable so that all instances of Fish
    # have the same value for the variable.
    set-dev-env-macOS.body = ''

if type zellij &>/dev/null
    if set -q ZELLIJ
    else
      zellij attach -c djzhang-mac
    end
end

    '';

    # Sets Fish Shell to light or dark colorscheme based on `$term_background`.
    set-fish-env-variables= {
      body = ''


# environment variable
set -g -x ORGANIZATIONS_HOME "$HOME/Documents/Organizations"
set -g -x  TRUJUNZHANG_DOTFILES_HOME "$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"

# Android SDK
# ======================================================================
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
set -g -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -g -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -g -x ANDROID_USER_HOME "$HOME/Library/Android/sdk"
set -g -x REACT_NATIVE_DOWNLOADS_DIR "$HOME/.local/RN_DOWNLOADS"
set -g -x ACT_BINARY "$HOME/.local/bin/act"


fish_add_path "$ANDROID_SDK_ROOT"
fish_add_path "$ANDROID_SDK_ROOT/tools"
fish_add_path "$ANDROID_SDK_ROOT/platform-tools"

# djzhang's bin
# ======================================================================
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/Documents/Organizations/__APPLICATIONS/BinApps"

# Aliases
if [ -f $TRUJUNZHANG_DOTFILES_HOME/config/fish/functions/trujunzhang.fish ]
    source $TRUJUNZHANG_DOTFILES_HOME/config/fish/functions/trujunzhang.fish
end

      '';
    };
  };
  # }}}

  # Fish configuration ------------------------------------------------------------------------- {{{

  # Aliases
  programs.fish.shellAliases = with pkgs; {
    # Nix related
    drb = "darwin-rebuild build --flake ${nixConfigDirectory}";
    drs = "darwin-rebuild switch --flake ${nixConfigDirectory}";
    flakeup = "nix flake update ${nixConfigDirectory}";
    nb = "nix build";
    nd = "nix develop";
    nf = "nix flake";
    nr = "nix run";
    ns = "nix search";

    # Other
    ".." = "cd ..";
    ":q" = "exit";
    la = "ll -a";
    ll = "ls -l --time-style long-iso --icons";
    ls = "${eza}/bin/eza";
    tb = "toggle-background";
  };

  programs.fish.shellAbbrs = {
    nixpkgs-review-pr = {
      expansion = ''
        echo -n x86_64-darwin aarch64-{darwin,linux} | \
          parallel -u -d ' ' -q fish -i -c 'nixpkgs-review pr --post-result --system {} %'
      '';
      setCursor = true;
    };
    nix-build-all-systems = {
      expansion = ''
        echo -n x86_64-darwin aarch64-{darwin,linux} | \
          parallel -u -d ' ' nix build -L -f . --system {} %
      '';
      setCursor = true;
    };
  };

  # Configuration that should be above `loginShellInit` and `interactiveShellInit`.
  programs.fish.shellInit = ''
    set -U fish_term24bit 1
    set-dev-env-macOS
    set-fish-env-variables
  '';

  programs.fish.interactiveShellInit = ''
    set -g fish_greeting ""
    ${pkgs.thefuck}/bin/thefuck --alias | source


  '';
  # }}}
}
# vim: foldmethod=marker
