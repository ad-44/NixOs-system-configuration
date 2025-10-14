{ config, pkgs, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  home.packages = with pkgs; [
  # Tryout
    neofetch
  ];

  home.stateVersion = "25.05";
}
