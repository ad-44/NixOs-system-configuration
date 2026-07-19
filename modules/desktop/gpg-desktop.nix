{ pkgs, lib, config, ...}:

{
  services.gpg-agent = {
    extraConfig = ''
      no-allow-external-cache  
    '';
  };
  
  programs.browserpass = {
    enable = true;
    browsers = ["firefox"];
  };
  
}
