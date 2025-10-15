{ config, pkgs, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  home.packages = with pkgs; [
  # Terminal
    neofetch
    foot
    starship
    git
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
    enable = true;
    enableBashIntegration = true;
    settings = {
    };
  };

  programs.git = {
    enable = true;
    userName = "ad-44";
    userEmail = "antoine.debille@gmail.com";
    };
  home.stateVersion = "25.05";
}
