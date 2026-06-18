{ inputs, config, pkgs, lib, zen-browser, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  home.packages = with pkgs; [
  # Terminal
    fastfetch
    btop
    wev
    glow
    libsecret
    w3m
    dante
    wl-clipboard
    didyoumean
    pandoc
    rustlings
    poppler-utils
    sttr
    visidata

  # System
    gcr
    vala
    seahorse
    poweralertd
    brightnessctl
    texliveFull
    texlab
    ltex-ls-plus
    tectonic
    bc
    libva-utils
    markdown-oxide
    marksman
    mpls
    xdg-utils
    vulkan-tools
    devenv
    
    # GUI
    awww
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight-official
    spotify
    qimgv
    gnupg
    passff-host
    pinentry-gnome3
    browserpass
    komikku
    # gtk4
    # gtk3
    iwgtk
    goodvibes
    signal-desktop
    localsend
    anytype
    brave
    gimp
    valent
    imagemagick
    dolphin-emu

    # Testing
    alsa-scarlett-gui
    ardour
    audacity
    links2
    tor-browser
    lite-xl
    comaps
    

  # Retroarch & cores
    (retroarch.withCores (cores: with cores; [
      dolphin
      gambatte
      mgba
      mupen64plus
      genesis-plus-gx
    ]))  
  ];

  # Import pkgs configurations
  imports = [
    ./pkgs-config
  ];

  # Enable application that does not need further settings
  services.awww.enable = false;
  programs.spotify-player.enable = true;
  programs.yazi.enable = true;
  programs.onlyoffice.enable = true;
  programs.uv.enable = true;
  programs.sioyek.enable = true;
  xdg.mime.enable = true;
  services.poweralertd.enable = true;
  programs.less.enable = true;
  programs.yt-dlp.enable = true;
  programs.freetube.enable = true;
  programs.fzf.enable = true;
  programs.element-desktop.enable = true;

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

  # fix yazi legacy shell wrapper name
  programs.yazi.shellWrapperName = "y";
  
  # Niri config vi symlink
  home.file = {
    ".config/niri/config.kdl".source = ./pkgs-config/niri/config.kdl;  
  };

  # Define session variables
  home.sessionVariables = {
    EDITOR = "hx";
    TERMINAL = "foot";
  };

  # Sioyek config
  programs.sioyek.config = {
    "page_separator_width" = "2";
  };
  
  home.stateVersion = "25.05";
}
