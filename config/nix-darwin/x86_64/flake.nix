{
  description ="djzhang's mac book pro darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let

     hostname = "djzhangs-MacBook-Pro";
     username = "djzhang";
     home = "/Users/djzhang";
     flakePath = "${home}/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/config/nix-darwin/x86_64";

    configuration = { pkgs, lib, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs;
        [
          # /run/current-system/sw/bin/fish
          # fish
          vim
          zellij
          rbenv
          direnv
          fzf
          watchman
          sketchybar
          fastlane
          mkcert

          vscode
          google-chrome

          # only for x86
          yabai
          skhd
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

            nixpkgs = {
              config = {
                allowUnfree = true;
              };
            };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
       programs.zsh.enable = true;  # default shell on catalina

           # Set fish as default shell
           programs.fish = {
             enable = true;
             shellAliases = {
               nce = "nvim ${flakePath}/flake.nix";
               ncu = "nix flake update ${flakePath}; darwin-rebuild switch --flake ${flakePath}";
             };

             loginShellInit = ''
               pfetch
             '';
           };
           users.users."${username}" = {
             shell = pkgs.fish;
             inherit home;
           };

      system.activationScripts.postActivation.text = ''
        # Set the default shell as fish for the user
        sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish ${username}

      '';



      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#djzhangs-MacBook-Pro
    darwinConfigurations."djzhangs-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."djzhangs-MacBook-Pro".pkgs;
  };
}
