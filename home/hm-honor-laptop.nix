{ pkgs, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  # Import modules
  imports = [
    ../modules
  ];  
  
  # Gpg pinentry configuration
  services = {
    gpg-agent = {
      pinentry.package = pkgs.pinentry-gnome3;
    };
  };
  
  home.stateVersion = "25.05";
}
