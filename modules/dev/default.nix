{ pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./git.nix
    ./helix.nix
    ./tmux/tmux.nix
    ./vscodium.nix
    ./zed-editor.nix
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
    nil
    nixd
  ];

  programs = {
    uv.enable = true;
  };
}
