{ pkgs, inputs, ... }:


{
  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];
  
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.browserpass];
  };
}
