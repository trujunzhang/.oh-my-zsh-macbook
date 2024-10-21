{
  description = "djzhang’s Nix system configs, and some other useful stuff.";

  inputs = {
    # Package sets
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Environment/system management
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Flake utilities
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";

    # Agda mode for Neovim
    # cornelis.url = "github:isovector/cornelis";
    # cornelis.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # cornelis.inputs.flake-compat.follows = "flake-compat";
    # cornelis.inputs.flake-utils.follows = "flake-utils";

    # Utility for watching macOS `defaults`.
    # prefmanager.url = "github:malob/prefmanager";
    # prefmanager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    # prefmanager.inputs.flake-compat.follows = "flake-compat";
    # prefmanager.inputs.flake-utils.follows = "flake-utils";

#    neovim-flake = {
      # url = "github:jordanisaacs/neovim-flake";
      # url = github:gvolpe/neovim-flake;
      # url = github:trujunzhang/neovim-flake;
      # url = git+file:///home/gvolpe/workspace/neovim-flake;
      # url = git+file:///home/gvolpe/workspace/neovim-flake;
      # url = "../neovim-flake-jordanisaacs?shallow=1";
      # url = file://$home/Documents/Organizations/__CODING/WORKING/@SharedPackage/@github/neovim-flake;
      # url = git+file:///Volumes/MacUser/djzhang/Documents/Organizations/__CODING/WORKING/@SharedPackage/@github/neovim-flake;
      # url = git+file:///Users/djzhang/Documents/Organizations/__CODING/WORKING/@SharedPackage/@github/neovim-flake;
      # url = path:/Users/djzhang/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/config/neovim-flake-jordanisaacs;
#      url = "/tmp/neovim-flake-jordanisaacs";
      # url = "~/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/config/neovim-flake-jordanisaacs";
      # url = "../neovim-flake-jordanisaacs";
      # inputs.nixpkgs.follows = "nixpkgs";
      # inputs.nixpkgs.follows = "nixpkgs-unstable";
      # inputs.flake-schemas.follows = "flake-schemas";
#    };
  };

#  outputs = { self, darwin, home-manager, flake-utils, neovim-flake, ... }@inputs:
  outputs = { self, darwin, home-manager, flake-utils, ... }@inputs:
    let
      inherit (self.lib) attrValues makeOverridable mkForce optionalAttrs singleton;

      homeStateVersion = "24.05";

      nixpkgsDefaults = {
        config = {
          allowUnfree = true;
        };
        overlays = attrValues self.overlays ++ [
          # inputs.cornelis.overlays.cornelis
          # inputs.prefmanager.overlays.prefmanager
        ] ++ singleton (
          final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            # Sub in x86 version of packages that don't build on Apple Silicon.
            inherit (final.pkgs-x86)
              # agda
              # idris2
              ;
          }) // {
            # Add other overlays here if needed.
          }
        );
      };

      primaryUserDefaults = {
        username = "djzhang";
        fullName = "dujun zhang";
        email = "trujunzhang@gmail.com";
        nixConfigDirectory = "/Volumes/MacUser/djzhang/.config/nixpkgs";
      };
    in
    {
      # Add some additional functions to `lib`.
      lib = inputs.nixpkgs-unstable.lib.extend (_: _: {
        mkDarwinSystem = import ./lib/mkDarwinSystem.nix inputs;
        lsnix = import ./lib/lsnix.nix;
      });

      # Overlays --------------------------------------------------------------------------------{{{

      overlays = {
        # Overlays to add different versions `nixpkgs` into package set
        pkgs-master = _: prev: {
          pkgs-master = import inputs.nixpkgs-master {
            inherit (prev.stdenv) system;
            inherit (nixpkgsDefaults) config;
          };
        };
        pkgs-stable = _: prev: {
          pkgs-stable = import inputs.nixpkgs-stable {
            inherit (prev.stdenv) system;
            inherit (nixpkgsDefaults) config;
          };
        };
        pkgs-unstable = _: prev: {
          pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit (prev.stdenv) system;
            inherit (nixpkgsDefaults) config;
          };
        };
        apple-silicon = _: prev: optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          # Add access to x86 packages system is running Apple Silicon
          pkgs-x86 = import inputs.nixpkgs-unstable {
            system = "x86_64-darwin";
            inherit (nixpkgsDefaults) config;
          };
        };

        # Overlay that adds various additional utility functions to `vimUtils`
        vimUtils = import ./overlays/vimUtils.nix;

        # Overlay that adds some additional Neovim plugins
        vimPlugins = final: prev:
          let
            inherit (self.overlays.vimUtils final prev) vimUtils;
          in
          {
            # vimPlugins = prev.vimPlugins.extend (_: _:
            #   # Useful for testing/using Vim plugins that aren't in `nixpkgs`.
            #   vimUtils.buildVimPluginsFromFlakeInputs inputs [
            #     # Add flake input names here for a Vim plugin repos
            #   ] // {
            #     # Other Vim plugins
            #     inherit (inputs.cornelis.packages.${prev.stdenv.system}) cornelis-vim;
            #   }
            # );
          };

        tweaks = _: _: {
          # Add temporary overrides here
        };
      };
      # }}}

      # Modules -------------------------------------------------------------------------------- {{{

      darwinModules = {
        # My configurations
        malo-bootstrap = import ./darwin/bootstrap.nix;
#        malo-defaults = import ./darwin/defaults.nix;
        malo-general = import ./darwin/general.nix;
#        malo-homebrew = import ./darwin/homebrew.nix;

        # Modules I've created
        users-primaryUser = import ./modules/darwin/users.nix;
      };

      homeManagerModules= {
        # My configurations
        malo-colors = import ./home/colors.nix;
        malo-config-files = import ./home/config-files.nix;
        malo-fish = import ./home/fish.nix;
        malo-git = import ./home/git.nix;
        malo-git-aliases = import ./home/git-aliases.nix;
        malo-gh-aliases = import ./home/gh-aliases.nix;
        # malo-kitty = import ./home/kitty.nix;
        malo-neovim = import ./home/neovim.nix;
        malo-emacs= import ./home/emacs.nix;
        malo-starship = import ./home/starship.nix;
        malo-starship-symbols = import ./home/starship-symbols.nix;

        malo-packages-common = import ./home/packages-common.nix;

        # neovim-flake
        # malo-neovim-flake-default = neovim-flake.homeManagerModules.default;
        # malo-neovim-flake-default = neovim-flake.homeManagerModules.${system}.default;
        # malo-neovim-flake-default = neovim-flake.homeManagerModules.aarch64-darwin.default;
#        malo-neovim-flake = import ./home/neovim-flake.nix { neovim-flake = neovim-flake; };
        # malo-neovim-flake = import ./home/neovim-flake.nix { neovim-flake = neovim-flake; packages = packages; };

        # Modules I've created
        colors = import ./modules/home/colors;
        # programs-neovim-extras = import ./modules/home/programs/neovim/extras.nix;
        # programs-kitty-extras = import ./modules/home/programs/kitty/extras.nix;
        home-user-info = { lib, ... }: {
          options.home.user-info =
            (self.darwinModules.users-primaryUser { inherit lib; }).options.users.primaryUser;
        };
      };

      homePlatformModules_arm = {
        malo-packages = import ./home/packages-arm.nix;
        malo-nginx= import ./home/nginx.nix;
      };

      homePlatformModules_x86 = {
        malo-packages = import ./home/packages-x86.nix;
      };

      # }}}

      # System configurations ------------------------------------------------------------------ {{{

      darwinConfigurations = {
        # Minimal macOS configurations to bootstrap systems
        bootstrap-x86 = makeOverridable darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [ ./darwin/bootstrap.nix { nixpkgs = nixpkgsDefaults; } ];
        };
        bootstrap-arm = self.darwinConfigurations.bootstrap-x86.override {
          system = "aarch64-darwin";
        };

        # My Apple Silicon macOS laptop config
        "djzhangs-Mac-mini" = makeOverridable self.lib.mkDarwinSystem (primaryUserDefaults // {
          system = "aarch64-darwin";
          userHome = "/Volumes/MacUser/djzhang";
          modules = attrValues self.darwinModules ++ singleton {
            nixpkgs = nixpkgsDefaults;
            networking.computerName = "djzhang";
            networking.hostName = "djzhangs-Mac-mini";
            networking.knownNetworkServices = [
              "Wi-Fi"
              "USB 10/100/1000 LAN"
            ];
            nix.registry.my.flake = inputs.self;
          };
          extraModules = singleton {
            nix.linux-builder.enable = false;
            nix.linux-builder.maxJobs = 8;
            nix.linux-builder.config = {
              virtualisation.darwin-builder.memorySize = 16 * 1024;
              virtualisation.cores = 8;
            };
          };
          inherit homeStateVersion;
          homeModules = attrValues self.homeManagerModules;
          extraPlatformModules = attrValues self.homePlatformModules_arm;
        });

        "djzhangs-MacBook-Pro" = makeOverridable self.lib.mkDarwinSystem (primaryUserDefaults // {
          system = "x86_64-darwin";
          userHome = "/Users/djzhang";
          modules = attrValues self.darwinModules ++ singleton {
            nixpkgs = nixpkgsDefaults;
            networking.computerName = "djzhang";
            networking.hostName = "djzhangs-MacBook-Pro";
            networking.knownNetworkServices = [
              "Wi-Fi"
              "USB 10/100/1000 LAN"
            ];
            nix.registry.my.flake = inputs.self;
          };
          extraModules = singleton {
            nix.linux-builder.enable = false;
            nix.linux-builder.maxJobs = 8;
            nix.linux-builder.config = {
              virtualisation.darwin-builder.memorySize = 16 * 1024;
              virtualisation.cores = 8;
            };
          };
          inherit homeStateVersion;
          homeModules = attrValues self.homeManagerModules;
          extraPlatformModules = attrValues self.homePlatformModules_x86;
        });
      };

    } // flake-utils.lib.eachDefaultSystem (system: {
      # Re-export `nixpkgs-unstable` with overlays.
      # This is handy in combination with setting `nix.registry.my.flake = inputs.self`.
      # Allows doing things like `nix run my#prefmanager -- watch --all`
      legacyPackages = import inputs.nixpkgs-unstable (nixpkgsDefaults // { inherit system; });

      # Development shells ----------------------------------------------------------------------{{{
      # Shell environments for development
      # With `nix.registry.my.flake = inputs.self`, development shells can be created by running,
      # e.g., `nix develop my#python`.
      # devShells = let pkgs = self.legacyPackages.${system}; in
      #   {
      #     python = pkgs.mkShell {
      #       name = "python310";
      #       inputsFrom = attrValues {
      #         inherit (pkgs.pkgs-master.python310Packages) black isort;
      #         inherit (pkgs) poetry python310 pyright;
      #       };
      #     };
      #   };
      # }}}
    });
}
# vim: foldmethod=marker
