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
    spotify-player
    wev
    glow
    libsecret
    aerc
    w3m
    dante
    wl-clipboard
    uv
    didyoumean

  # System
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
    spotify
    waybar
    mpv
    zed-editor
    qimgv
    thunderbird
    onlyoffice-desktopeditors
    gnupg
    passff-host
    pinentry-gnome3
    browserpass
    musicpod
    clipse
    sioyek

  # Retroarch & cores
    (retroarch.withCores (cores: with cores; [
      dolphin
    ]))  
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
  services.gnome-keyring.enable = false;
  programs.onlyoffice.enable = true;
  programs.uv.enable = true;
  programs.sioyek.enable = true;
  xdg.mime.enable = true;

  # USB mount
  services.udiskie.enable = true;
  
  # Clipboard manager options
  services.clipse = {
    enable = true;
    imageDisplay = {
      type = "sixel";
      scaleX = 14;
      scaleY = 16;  
    };
  };
  
  # Niri config vi symlink
  home.file = {
    ".config/niri/config.kdl".source = ./pkgs-config/niri/config.kdl;  
  };

  # Define session variables
  home.sessionVariables = {
    EDITOR = "hx";
    TERMINAL = "foot";
  };
  
  home.stateVersion = "25.05";
}
