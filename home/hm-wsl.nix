{ inputs, config, pkgs, lib, zen-browser, ... }:

{
  home.username = "antoine";
  home.homeDirectory = "/home/antoine";

  # Import modules
  imports = [
    ../modules/dev
    ../modules/cli
  ];

  # Defining pinetry for gpgagent

  services = {
    gpg-agent = {
      pinentry.package = pkgs.pinentry-tty;
    };
  };

  home.stateVersion = "25.05";
}
