{ inputs, config, pkgs, lib, zen-browser, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  home.packages = with pkgs; [
  # Terminal
    neofetch
    foot
    starship
    git
    helix
    btop
    yazi
    wev
    glow
    libsecret

  # System
    gnome-keyring
    gcr
    vala
    seahorse
    hypridle
    hyprlock
    
  # GUI
    swww
    fuzzel
    inputs.zen-browser.packages."${system}".twilight-official
    swaynotificationcenter
    spotify-player
    spotify
    waybar
    mpv
    zed-editor
    qimgv
    thunderbird
  ];

  # Import pkgs configurations
  imports = [
    ./pkgs-config
  ];

  # Enable application that does not need further settings
  services.swww.enable = true;
  programs.spotify-player.enable = true;
  services.network-manager-applet.enable = true;
  programs.yazi.enable = true;
  programs.mpv.enable = true;
  programs.zed-editor.enable = true;
  services.gnome-keyring.enable = true;

  # Niri config vi symlink
  home.file = {
    ".config/niri/config.kdl".source = ./pkgs-config/niri/config.kdl;  
  };
  
  home.stateVersion = "25.05";
}
