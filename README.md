# NixOS system configuration

This repository contains my laptop Nixos configuration.

## System

Nixos + Home Manager as a nix module + Niri windows manager.

## Tree
.
├── flake.lock
├── flake.nix
├── home
│   ├── hm-honor-laptop.nix
│   └── hm-wsl.nix
├── hosts
│   ├── common
│   │   ├── common-pkgs.nix
│   │   └── common-settings.nix
│   ├── honor-laptop
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── wsl
│       └── configuration.nix
├── modules
│   ├── cli
│   │   ├── bash.nix
│   │   ├── default.nix
│   │   ├── foot.nix
│   │   ├── gpg-cli.nix
│   │   └── starship.nix
│   ├── default.nix
│   ├── desktop
│   │   ├── default.nix
│   │   ├── fuzzel.nix
│   │   ├── gpg-desktop.nix
│   │   ├── hypridle.nix
│   │   ├── hyprlock.nix
│   │   ├── mail.nix
│   │   ├── mimeapps.nix
│   │   ├── niri
│   │   │   └── config.kdl
│   │   ├── qt.nix
│   │   ├── scripts
│   │   │   ├── brightness_notif.sh
│   │   │   ├── mute-mic.sh
│   │   │   ├── mute-volume.sh
│   │   │   └── volume_notif.sh
│   │   ├── stylix.nix
│   │   ├── swaync.nix
│   │   ├── wallpapers
│   │   │   ├── wallpaper.jpg
│   │   │   └── yol.jpg
│   │   └── waybar.nix
│   ├── dev
│   │   ├── default.nix
│   │   ├── direnv.nix
│   │   ├── git.nix
│   │   ├── helix.nix
│   │   ├── tmux
│   │   │   ├── scripts
│   │   │   │   ├── hx-to-repl.nix
│   │   │   │   └── tmux-python-dev.nix
│   │   │   └── tmux.nix
│   │   └── vscodium.nix
│   ├── gaming
│   │   └── default.nix
│   └── gui
│       ├── default.nix
│       └── zen-browser.nix
├── overlays
│   └── default.nix
└── README.md

### Home
Where home manager is configured for all hosts.

>[!IMPORTANT]
>Pinentry is configured directly in each home files in order for them not to overlap. ***WSL*** is a full CLI hosts, hence needed a non graphical pinentry, where ***Honor-laptop*** uses a graphical one.

### Hosts
Where NixOs configuration files are sorted for each hosts.

>[!NOTE]
>The *Common* folder is structured in two parts :
>- pkgs : for common packages
>- settings : for common settings 
>
>As for now, ***WSL*** hosts does not need any common settings, hence it only import common packages.

### Modules
Where home manager modules are sorted. As for now, they are sorted into five categories:
- cli: command line applications
- desktop: all applications and configuration related to the desktop environment (Niri here for ***honor-laptop***)
- dev: all applications related to programming
- gaming: all applications related to gaming
- gui: all others graphical applications

>[!NOTE]
>***WSL*** host import only *dev* and *cli* modules.
>***Honor-laptop*** import all modules.

### Overlays
Where all overlays used in the flake configuration are stored.
