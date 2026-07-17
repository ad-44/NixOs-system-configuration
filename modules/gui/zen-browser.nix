{ inputs, pkgs, config, lib, zen-browser, ... }:

{
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.browserpass];
  };
}
