{ pkgs, config, lib, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = true;
        font = lib.mkForce "${config.stylix.fonts.sansSerif.name}:pixelsize=22";
        anchor = "top-left";
        x-margin = 10;
        y-margin = 10;
        width = 15;
        lines = 39;
      };     
    };
  };
}
