{ config, pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./git.nix
    ./helix.nix
    ./tmux/tmux.nix
    ./vscodium.nix
  ];

  home.packages = with pkgs; [
    rustlings
    visidata
    texliveFull
    texlab
    ltex-ls-plus
    tectonic
    markdown-oxide
    marksman
    mpls
    devenv
  ];

  programs = {
    uv.enable = true;
  };
}
