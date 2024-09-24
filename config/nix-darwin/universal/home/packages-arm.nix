{ config, lib, pkgs, ... }:

let inherit (lib) mkIf elem; in

{
  home.packages = lib.attrValues ({
    # Some basics
    inherit (pkgs)
      ruby_3_3
      vscode
#      neovim
      # alacritty
      # wezterm
      ;

  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    inherit (pkgs)
      # prefmanager # tool for working with macOS defaults
      ;
  });
}
