# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/common-pkgs.nix
      ../common/common-settings.nix
    ];

  # Bootloader (honor-laptop is using UEFI, hence grub is not needed)
  boot.loader.grub.enable = false;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure hardware graphics
  hardware.graphics.enable = true;
  
  networking.hostName = "honor-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd = {
      enable = true;
      settings = {
        Network = {
          EnableIPv6 = true;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

  # Configure keymap in X11
  services.xserver = {
    enable = false;
    xkb = {
    layout = "fr";
    variant = "";
    };
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.antoine = {
    isNormalUser = true;
    description = "Antoine";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  xwayland-satellite
  ];
    
  # Programs and services enable
  programs = {
    niri.enable = true;
    xwayland.enable = true;
    gnome-disks.enable = true;
    nix-ld.enable = true;
    gphoto2.enable = true;
  };

  services = {
    blueman.enable = true;
    gvfs.enable = true;
    upower.enable = true;
    displayManager.ly.enable = true;
  };
  
  # Bluetooth is off on boot
  hardware.bluetooth= {
    enable = true;
    powerOnBoot = false;
  };

  # Enable this service to discover other devices on my network
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
  
  # Finger print scanner (does not work for honor-laptop hardware but I let it for others just in case)
  services.fprintd = {
    enable = false;
    package = pkgs.fprintd-tod;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  # Enabling stylix to change the colorscheme of my computer (kanagawa here)     
  stylix = {
    enable = true;
    image = ../../modules/desktop/wallpapers/yol.jpg ;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    polarity = "dark";
    override = {base00 = "000000";};
   };
   
  # Portal configuration
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal
    ];
    config = {
      common = {
        default = [ "wlr" ];
      };
      # niri = {
      #   default = [ "wlr"];
      # };
    };
  };
    
  # Audio configuration with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Fix uv python ssl.SSLCertVerificationError
  environment.etc.certfile = {
    source = "/etc/ssl/certs/ca-bundle.crt";
    target = "ssl/cert.pem";
  };
  
  # Laptop battery management
  powerManagement.powertop.enable = true;
  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        STOP_CHARGE_THRESH_BAT0 = 95;
      };
    };
  };

  # Environment variables
  environment.variables = {
    GSK_RENDERER = "Vulkan";
  };

  # Environment sessionVariables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; #IME workaround for electron app
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
    GDK_BACKEND = "wayland";
    WAYLAND_DISPLAY = "wayland-1";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
