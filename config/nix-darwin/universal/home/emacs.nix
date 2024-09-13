{ config, lib, pkgs, ... }:

{
  # emacs
  # https://nixos.wiki/wiki/Emacs
  programs.emacs = {
      enable = true;
      package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
      # package = pkgs.emacs-nox;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
    };

  # Enabling the Emacs daemon
#  services.emacs = {
#     enable = true;
#     package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
#   };

  # }}}
}
# vim: foldmethod=marker
