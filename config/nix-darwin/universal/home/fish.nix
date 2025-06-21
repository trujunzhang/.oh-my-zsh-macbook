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

if [ -d $HOME/.luarocks ]
   # for i in (luarocks path | awk '{sub(/PATH=/, "PATH ", $2); 
   #     print "set -gx "$2}'); 
   #     eval $i; 
   # end
   fish_add_path "$HOME/.luarocks/bin"
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# if [ -d $HOME/.asdf ]
#     source ~/.asdf/asdf.fish
# end
if [ -d $HOME/.asdf/plugins/java ]
    source ~/.asdf/plugins/java/set-java-home.fish
end

    '';

    # Sets Fish Shell to light or dark colorscheme based on `$term_background`.
    set-fish-env-variables= {
      body = ''

# export http_proxy=127.0.0.1:1088;export https_proxy=$http_proxy
# set -g -x  http_proxy 127.0.0.1:1234
# set -g -x  https_proxy 127.0.0.1:1234

# environment variable
set -g -x  ORGANIZATIONS_HOME "$HOME/Documents/Organizations"
set -g -x  TRUJUNZHANG_DOTFILES_HOME "$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"
set -g -x  ACT_BINARY "/etc/profiles/per-user/djzhang/bin/act"

# Android SDK
# ======================================================================
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
set -g -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -g -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -g -x ANDROID_USER_HOME "$HOME/Library/Android/sdk"
set -g -x REACT_NATIVE_DOWNLOADS_DIR "$HOME/.local/RN_DOWNLOADS"
set -g -x ACT_BINARY "/etc/profiles/per-user/djzhang/bin/act"

# export MAVEN_OPTS="-Dmaven.repo.local=/path/to/repository"
set -g -x MAVEN_OPTS "-Dmaven.repo.local=$HOME/.m2/repository"

# Deepseek apikey
set -g -x OPENAI_API_KEY "sk-52a473fee60f456c8952b11aa59cef81"

if test "$(uname -m)" = 'arm64'
    fish_add_path "$HOME/.local/bin/helix-aarch64-macos"
end

if test "$(uname -m)" = 'x86_64'
    fish_add_path "$HOME/.local/bin/helix-x86_64-macos"
end

fish_add_path "$HOME/.orbstack/bin"
fish_add_path "$ANDROID_SDK_ROOT"
fish_add_path "$ANDROID_SDK_ROOT/tools"
fish_add_path "$ANDROID_SDK_ROOT/platform-tools"

fish_add_path "/opt/homebrew/opt/ruby@3.3/bin"

fish_add_path "/Applications/Neovide.app/Contents/MacOS"

# homebrew
if [ -d "/opt/homebrew" ]
    fish_add_path "/opt/homebrew/bin/"
    # eval "$(/opt/homebrew/bin/brew shellenv)"
end

# rbenv
set -x PATH $PATH "$HOME/.rbenv/bin"
if [ -d "$HOME/.rbenv" ]
    # $HOME/.rbenv/bin/rbenv init
    # rbenv init - | source
    rbenv init - fish | source
end

# djzhang's bin
# ======================================================================
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/Documents/Organizations/__APPLICATIONS/BinApps"
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

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
    emacs = "${pkgs.emacs}/Applications/Emacs.app/Contents/MacOS/Emacs";

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
