{ pkgs, config, lib, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = true;
        font = lib.mkForce "${config.stylix.fonts.sansSerif.name}:pixelsize=22";
      };     
    };
  };
}
