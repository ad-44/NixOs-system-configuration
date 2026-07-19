{ pkgs, lib, config, ...}:

{
  services.gpg-agent = {
    pinentry = {
      package = pkgs.pinentry-gnome3;
    };
    extraConfig = ''
      no-allow-external-cache  
    '';
  };
  
  programs.browserpass = {
    enable = true;
    browsers = ["firefox"];
  };
  
}
