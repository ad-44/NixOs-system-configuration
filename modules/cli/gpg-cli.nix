{ pkgs, config, ... }:

{
  programs = {
    gpg.enable = true;
    
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    password-store = {
      enable = true;
      settings = {
        PASSWORD_STORE_DIR = "/home/antoine/.local/share/password-store";
      };
    };
        
  };

  services = {
    
    password-store = {
      settings = {
        storePath = "/home/antoine/.local/share/password-store";    
      };
    };
      
  };
  
}
