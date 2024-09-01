flakes: { inputs, outputs, config, pkgs, lib, ... }:
with lib;
# Let-In ----------------------------------------------------------------------------------------{{{
let
    configModule = {
      config.vim.theme.name = "dracula-nvim";
      config.vim.languages.nix.enable = false;
    };

    configModule2 = {
      config.vim.theme.name = lib.mkForce "catppuccin";
      config.vim.languages.nix.enable = lib.mkForce true;
    };

    baseNeovim = flakes.neovim-flake.packages.${pkgs.system}.maximal;
    neovimExtended = baseNeovim.extendConfiguration {modules = [configModule];};
    finalNeovim = neovimExtended.extendConfiguration {
      modules = [configModule2];
      inherit pkgs;
    };
  in {
    packages.${pkgs.system}.neovim = finalNeovim;
  }