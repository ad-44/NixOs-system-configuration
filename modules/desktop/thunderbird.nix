{ pkgs, config, ... }:

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

  accounts.email.accounts = {
    Gmail.thunderbird.enable = true;
    University.thunderbird.enable = true;
  };
  
}

