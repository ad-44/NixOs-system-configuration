# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader (this laptop is using UEFI, hence grub is not needed)
  boot.loader.grub.enable = false;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure hardware graphics
  hardware.graphics.enable = true;
  
  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  # Enabling flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
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
  wget
  niri
  ly
  libnotify
  xwayland-satellite
  networkmanager
  networkmanagerapplet
  blueman
  jq
  killall
  gvfs
  pavucontrol
  nautilus
  xdg-desktop-portal-wlr
  xdg-desktop-portal
  nix-ld
  upower
  powertop
  tlp
  ffmpeg
  usbutils
  ];
    
  # Programs and services enable
  programs.niri.enable = true;
  programs.git.enable = true;
  services.displayManager.ly.enable = true;
  programs.ssh.startAgent = false;
  programs.xwayland.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.gvfs.enable = true;
  programs.nix-ld.enable = true;
  services.udisks2.enable = true;

    #finger print scanner
  services.fprintd = {
    enable = false;
    package = pkgs.fprintd-tod;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };
  
  
  services.upower = {
    enable = true;
  };
    
  stylix = {
    enable = true;
    image = ./Wallpapers/wallpaper.jpg;
    polarity = "dark";
    override = {base00 = "000000";};
   };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = [ "wlr" ];
      };
      niri = {
        default = [ "wlr"];
      };
    };
  };

  # Enable login password to decrypt wallet/keyring
  # security.pam.services.login.enableGnomeKeyring = false;
  # security.pam.services.antoine.gnupg.enable = true;
    
  # Audio configuration with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  fonts.packages = with pkgs; [
    fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
  ];
  
  # Reducing disk usage
  boot.loader.systemd-boot.configurationLimit = 10;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

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
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
