{ inputs, config, pkgs, lib, zen-browser, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  # Import modules
  imports = [
    ../modules/dev
    ../modules/cli
  ];

  home.stateVersion = "25.05";
}
