{ config, lib, pkgs, ... }:

let inherit (lib) mkIf elem; in

{

  home.packages = lib.attrValues ({
    # Some basics
    inherit (pkgs)
      ruby_3_2
      vscode
      alacritty
      # wezterm
      ;

  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    inherit (pkgs)
      # prefmanager # tool for working with macOS defaults
      ;
  });
}
