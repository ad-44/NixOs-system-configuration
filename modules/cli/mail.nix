{ pkgs, config, lib, ... }:

{
 
  accounts.email.accounts.Gmail = {
    primary = true;
    realName = "Antoine Debille";
    address = "antoine.debille@gmail.com";
    userName = "antoine.debille@gmail.com";
    imap = {
      host = "imap.gmail.com";
      port = 993;
      authentication = "xoauth2";
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    smtp = {
      host = "smtp.gmail.com";
      port = 465;
      authentication = "xoauth2";
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    passwordCommand = "pass show mail/gmail | head -n 1";
    
  };

  accounts.email.accounts.University = {
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
