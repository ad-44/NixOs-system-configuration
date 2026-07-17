{ inputs, config, pkgs, ... }:

{
  # Time zone and internationalisation properties
  time.timeZone = "Europe/Paris";

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

  # Enabling flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.channel.enable = false;
  
  # Fonts packages 
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
  nix.settings.max-jobs = "auto";

  # Common packages and services
  environment.systemPackages = with pkgs; [
  wget
  vim
  jq
  killall
  usbutils
  net-tools
  netcat-gnu
  curl
  git  
  ];

  services = {
    udisks2.enable = true;
  };
  
}
