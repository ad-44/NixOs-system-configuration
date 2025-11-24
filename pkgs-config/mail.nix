{ pkgs, config, lib, ... }:

{
  programs.thunderbird = {
    enable = true;

    settings = {
      "privacy.donottrackheader.enabled" = true;
    };

    profiles.Gmail = {
      isDefault = true;
    };
  };

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
  
  accounts.email.accounts.Gmail = {
    thunderbird.enable = true;
    primary = true;
    realName = "Antoine Debille";
    address = "antoine.debille@gmail.com";
    userName = "antoine.debille@gmail.com";
    imap = {
      host = "imap.gmail.com";
      port = 993;
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    smtp = {
      host = "smtp-tls.gmail.com";
      port = 465;
      tls = {
        enable = true;
        useStartTls = true;
      };
    };
    passwordCommand = "pass show mail/gmail | head -n 1";
    
  };

  accounts.email.accounts.University = {
    aerc.enable = true;
    thunderbird.enable = true;
    primary = false;
    realName = "Antoine Debille";
    address = "antoine.debille@univ-nantes.fr";
    userName = "debille-a-1";
    imap = {
      host = "imaps.univ-nantes.fr";
      port = 993;
      tls = {
        enable = true;
        useStartTls = false;  
      }; 
    };
    smtp = {
      host = "smtp-tls.univ-nantes.fr";
      port = 465;
      tls = {
        enable = true;
        useStartTls = true;
      };
    };
    passwordCommand = "pass show mail/université | head -n 1";
  };
}
