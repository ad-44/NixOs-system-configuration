{ config, pkgs, lib, ... }:

{
  imports = [
    ./fuzzel.nix
    ./gpg-desktop.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./mail.nix
    ./mimeapps.nix
    ./qt.nix
    ./stylix.nix
    ./swaync.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    poppler-utils
    gcr
    vala
    seahorse
    brightnessctl
    libva-utils
    xdg-utils
    vulkan-tools
    libnotify
    pavucontrol
    nautilus
    ffmpeg
    spectre-meltdown-checker
    awww
    gnupg
    pinentry-gnome3
    browserpass
    iwgtk
    eog
    libimobiledevice
    ifuse
  ];

  programs = {
    sioyek = {
          enable = true;
          config = {
            "page_separator_width" = "2";
          };
        };
    quickshell.enable = true;
  };
  
  services = {
    poweralertd.enable = true; #battery alert notifications
    udiskie.enable = true; #USB automount

    # Clipboard manager
    clipse = {
      enable = true;
      imageDisplay = {
        type = "sixel";
        scaleX = 14;
        scaleY = 16;
      };
    };

        
  };

  # Niri symlink config
  home.file = {
    ".config/niri/config.kdl".source = ./niri/config.kdl;
  };

  # Session variables
  home.sessionVariables = {
    EDITOR = "hx";
    TERMINAL = "foot";
  };
  
}
