{ config, pkgs, ... }:

let
  tmuxPythonDev = import ./scripts/tmux-python-dev.nix { inherit pkgs; };
  hxREPL = import ./scripts/hx-to-repl.nix { inherit pkgs; };
in
{
  programs.tmux = {
    enable = true;
    prefix = "M-f";
    mouse = true;
    baseIndex = 1;
  };

  home.packages = [
    tmuxPythonDev
    hxREPL
     ];
}
