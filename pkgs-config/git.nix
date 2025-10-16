{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ad-44";
    userEmail = "antoine.debille@gmail.com";
    };
}
