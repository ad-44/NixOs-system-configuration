{ pkgs, config, lib, ... }:

{
  programs.thunderbird = {
    enable = true;

    settings = {
      "privacy.donottrackheader.enabled" = true;
    };

    profiles.gmail = {
      isDefault = true;
    };
  };

  accounts.email.accounts.gmail = {
    primary = true;
    realName = "Antoine Debille";
    address = "antoine.debille@gmail.com";
    userName = "antoine.debille@gmail.com";
    imap = {
      host = "imap.gmail.com";
      port = 993;
      tls.enable = true;  
    };
    smtp = {
      host = "smtp.gmail.com";
      port = 587;
      tls = {
        enable = true;
        useStartTls = true;
      };
    };
    passwordCommand = "secret-tool lookup key gmail";
    
  };
}
