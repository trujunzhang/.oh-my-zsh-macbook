{ pkgs, ... }:

{
  # Networking
  networking.dns = [
    "1.1.1.1" # Cloudflare
    "8.8.8.8" # Google
  ];

  # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs; [
    kitty
    terminal-notifier
  ];
  programs.nix-index.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
   ];

  # Store management
  nix.gc.automatic = true;
  nix.gc.interval.Hour = 3;
  nix.gc.options = "--delete-older-than 15d";
  nix.optimise.automatic = true;
  nix.optimise.interval.Hour = 4;
}
