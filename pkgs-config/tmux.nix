{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "M-f";
  };
}
