{config, pkgs, lib, ...}:
with lib;
{
   services.jenkins = {
      enable = true;
      port = 5000;
    };
}
