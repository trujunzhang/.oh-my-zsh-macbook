{
  config,
  hostname,
  inputs,
  lib,
  outputs,
  pkgs,
  platform,
  username,
  ...
}:
{
  # Only install the docs I use
  documentation.enable = false;
  documentation.doc.enable = false;
  documentation.info.enable = false;
  documentation.man.enable = false;


     nix.settings.substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"];
     nix.settings.trusted-substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"];
     nix.settings.trusted-users = ["${config.user.name}" "root" "djzhang"];

     nixpkgs = {
       # Configure your nixpkgs instance
       config.allowUnfree = false;
       hostPlatform = lib.mkDefault "${platform}";
       # You can add overlays here
       overlays = [
         # Add overlays your own flake exports (from overlays and pkgs dir):
         outputs.overlays.additions
         outputs.overlays.modifications
         outputs.overlays.unstable-packages
         # Add overlays exported from other flakes:
       ];
     };
}

