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
  
  ];

  #Import pkgs configurations
  imports = [
    ./pkgs-config
  ];  

   home.stateVersion = "25.05";
}
