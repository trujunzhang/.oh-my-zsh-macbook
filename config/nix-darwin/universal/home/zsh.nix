{ config, lib, pkgs, ... }:

let
  inherit (lib) elem optionalString;
  inherit (config.home.user-info) nixConfigDirectory;
in

{
  # zsh Shell
  programs.zsh.enable = true;

  # zsh configuration ------------------------------------------------------------------------- {{{

  # Aliases
  programs.zsh.shellAliases = with pkgs; {
    nd = "nix develop";
    dcd_home = "cd $HOME/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook";
    dmac_unzip_common_apps = "unzip -o '/Volumes/MacGame/MacCache/apps/Applications/*.zip' -d /Applications";
    dmac_unzip_vpn_apps = "unzip -o '/Volumes/MacGame/MacCache/apps/v2ray/*.zip' -d /Applications";
    dmac_link_homebrew="sudo ln -s /Volumes/MacGame/MacCache/homebrew /opt/homebrew";
  };

  # }}}
}
# vim: foldmethod=marker
