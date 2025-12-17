{ config, pkgs, lib, ... }:

{
  programs.qt = {
    enable = true;
    plateformTheme.name = "gtk4";
  };
}
