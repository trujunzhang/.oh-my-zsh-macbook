return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    require("plugins.telescope.config.harpoon-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
