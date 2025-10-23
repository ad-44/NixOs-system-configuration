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
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
    
  };

}  
