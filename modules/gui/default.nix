{ inputs, config, pkgs, lib, ... }:

{

  imports = [
    inputs.zen-browser.homeModules.twilight-official
    ./zen-browser.nix
  ];
  
  home.packages = with pkgs; [
    spotify
    komikku
    goodvibes
    signal-desktop
    localsend
    anytype
    brave
    gimp
    valent
    tor-browser
  ];

    
  programs = {
    onlyoffice.enable = true;
    freetube.enable = true;

    mpv = {
      enable = true;
      config = {
        hwdec = "auto"; #Enabling hardware decoding
      };
    };
    
  };

  
}
