{ inputs, config, pkgs, lib, zen-browser, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  # Import modules
  imports = [
    ../modules
  ];  
  
  home.stateVersion = "25.05";
}
