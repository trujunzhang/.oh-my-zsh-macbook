
{ config, lib, pkgs, ... }:

{

    # services.nginx = {
    #   enable = true;
    #   recommendedProxySettings = true;
    #   recommendedTlsSettings = true;
    #   virtualHosts."localhost" = {
    #     locations."/wiki".proxyPass = "http://localhost:8000";
    #     locations."/weblog".proxyPass = "http://localhost:3001";
    #     root = "/var/www/myhost.org";
    #   };
    #   appendHttpConfig = "listen 127.0.0.1:8080";
    # };

#  services.nginx = {
#     enable = true;
#   };


}
# vim: foldmethod=marker
