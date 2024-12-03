{config, pkgs, lib, ...}:
{
      config = {
        services.jenkins = {
            enable = true;
            port = 5000;
        };
      };
}
