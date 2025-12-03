{ pkgs, config, lib, inputs, stylix,  ...}:

{
  stylix.fonts = {
    serif = {
      package = pkgs.libertinus;
      name = "Libertinus Serif";      
    };

    sansSerif = {
      package = pkgs.libertinus;
      name = "Libertinus Sans";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };

  };

  stylix.icons = {
    enable = true;
    package = pkgs.papirus-icon-theme;
    dark = "Papirus-Dark";
    light = "Papirus";
  };

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 16;
  };
}  
