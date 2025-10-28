{ inputs, config, pkgs, lib, zen-browser, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  home.packages = with pkgs; [
  # Terminal
    neofetch
    foot
    starship
    git
    helix
    btop

  # System
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    gnome-keyring
    vala
    gvfs
    
  # GUI
    swww
    fuzzel
    inputs.zen-browser.packages."${system}".twilight-official
    swaynotificationcenter
    spotify-player
    spotify
  ];

  #Import pkgs configurations
  imports = [
    ./pkgs-config
  ];

  #Enable application that does not need further settings
  services.swww.enable = true;  
  programs.spotify-player.enable = true;
  services.network-manager-applet.enable = true;
       
  home.stateVersion = "25.05";
}
