{ pkgs, config, lib, ...}:

{
  
  programs.aerc = {
    enable = true;
    extraConfig = {
      general = {
        unsafe-accounts-conf = true;
        term = "foot";
      };
      viewer = {
        pager = "glow -p";
      };
      filters = {
        "text/plain" = "glow -p";
        "text/html" = "glow -p";
      };
    };
  };

  accounts.email.accounts = {
    University.aerc.enable = true;
  };
  
}
