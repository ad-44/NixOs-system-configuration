{ inputs, config, pkgs, ... }:

{
  
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
  bc
  ];

  services = {
    udisks2.enable = true;
  };
  
}
