{ pkgs, config, lib, ... }:

{
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.browserpass];
  };
}
