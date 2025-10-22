{ config, pkgs, lib, ... }:

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

  # GUI
    swww
    fuzzel
  ];

  #Import pkgs configurations
  imports = [
    ./pkgs-config
  ];

  services.swww.enable = true;  

   home.stateVersion = "25.05";
}
