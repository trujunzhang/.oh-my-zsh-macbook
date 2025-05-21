{ config, lib, pkgs, ... }:

let
  inherit (lib) elem optionalString;
  inherit (config.home.user-info) nixConfigDirectory;
in

{
  # zsh Shell
  programs.zsh = {
      enable = true;

      # TODO source from file (e.g., .zshrc)
      initExtra = ''


        # rbenv
        export PATH=$HOME/.rbenv/bin:$PATH
        if [ -d "$HOME/.rbenv" ]; then
           $HOME/.rbenv/bin/rbenv init
           # rbenv init - | source
        fi


if [ -d $HOME/.asdf ]; then
    . "$HOME/.asdf/asdf.sh"
fi

# Android SDK
# ======================================================================
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_USER_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
        '';
  };

  # zsh configuration ------------------------------------------------------------------------- {{{

  # Aliases
  programs.zsh.shellAliases = with pkgs; {
    nd = "nix develop";
    dcd_home = "cd $HOME/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook";
    dmac_unzip_common_apps = "unzip -o '/Volumes/MacGame/MacCache/apps/Applications/*.zip' -d /Applications";
    dmac_unzip_vpn_apps = "unzip -o '/Volumes/MacGame/MacCache/apps/v2ray/*.zip' -d /Applications";
    dmac_link_homebrew = "sudo ln -s /Volumes/MacGame/MacCache/homebrew /opt/homebrew";
  };

  # }}}
}
# vim: foldmethod=marker
