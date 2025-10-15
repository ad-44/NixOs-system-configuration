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
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:pixelsize=16";
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
    enable = false;
    enableBashIntegration = true;
    settings = {
    };
  };
  
  home.stateVersion = "25.05";
}
