return {
  "michaelb/sniprun",
  build = "bash ./install.sh",
  config = function()
    require("plugins.language.config.sniprun-config")
  end,
  cmd = "SnipRun",
}
