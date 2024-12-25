
{ config, lib, pkgs, ... }:

let
  inherit (lib) elem optionalString;
  inherit (config.home.user-info) nixConfigDirectory;
in

{
  # bash Shell
  programs.bash = {
      enable = true;
      historyControl = [ "ignoredups" ];
      historySize = 1000000;
      historyFileSize = 1000000;

      # TODO source from file (e.g., .bashrc)
      initExtra = ''
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
  programs.bash.shellAliases = with pkgs; {
    nd = "nix develop";
    dcd_home = "cd $HOME/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook";
    dmac_unzip_common_apps = "unzip -o '/Volumes/MacGame/MacCache/apps/Applications/*.zip' -d /Applications";
    dmac_unzip_vpn_apps = "unzip -o '/Volumes/MacGame/MacCache/apps/v2ray/*.zip' -d /Applications";
    dmac_link_homebrew = "sudo ln -s /Volumes/MacGame/MacCache/homebrew /opt/homebrew";
  };

  # }}}
}
# vim: foldmethod=marker
