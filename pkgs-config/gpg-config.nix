{ pkgs, lib, config, ...}:

{
  programs.password-store.enable = true;
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
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
  
  programs.password-store.settings = {
    PASSWORD_STORE_DIR = "/home/antoine/.local/share/password-store";
  };
  services.pass-secret-service.storePath = "/home/antoine/.local/share/password-store";
}
