{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "M-f";
    mouse = true;
  };
}
