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
    yt-dlp
    less

  # System
    gcr
    vala
    seahorse
    hypridle
    hyprlock
    poweralertd
    brightnessctl
    texliveFull
    texlab
    ltex-ls-plus
    tectonic
    bc
    libva-utils
    markdown-oxide
    xdg-utils
    
    # GUI
    swww
    fuzzel
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight-official
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
    clipse
    sioyek
    komikku
    gtk4

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
  programs.zed-editor.enable = true;
  services.gnome-keyring.enable = false;
  programs.onlyoffice.enable = true;
  programs.uv.enable = true;
  programs.sioyek.enable = true;
  xdg.mime.enable = true;
  services.poweralertd.enable = true;
  programs.less.enable = true;
  programs.yt-dlp.enable = true;
  programs.freetube.enable = true;

  # USB mount
  services.udiskie.enable = true;

  # mpv enable hardware decoding
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto";
    };  
  };
  
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
