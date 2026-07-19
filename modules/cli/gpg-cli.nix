{ pkgs, config, ... }:

{
  programs = {
    gpg.enable = true;
    
    password-store = {
      enable = true;
      settings = {
        PASSWORD_STORE_DIR = "/home/antoine/.local/share/password-store";
      };
    };
        
  };

  services = {
    
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };

    pass-secret-service = {
      storePath = "/home/antoine/.local/share/password-store";
    };
             
  };
  
}
