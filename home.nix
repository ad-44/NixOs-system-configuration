{ config, pkgs, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  home.packages = with pkgs; [
  # Terminal
    neofetch
    foot
    starship
  ];

  programs.foot = {
    enable = true;
    theme = "catppuccin-mocha";
    settings = {
      main = {
        font = "Mononoki:pixelsize=12";
      };
    };
  };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };

  programs.starship = {
    enable = true;
    presets = ["catppuccin_mocha"];
  };
  
  home.stateVersion = "25.05";
}
