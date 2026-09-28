{ pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{

  imports = [
    ./zen-browser.nix
  ];

  home.packages = with pkgs; [
    unstable.anytype
    spotify
    komikku
    goodvibes
    signal-desktop
    localsend
    brave
    gimp
    valent
    tor-browser
    synology-drive-client
    tauon
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
