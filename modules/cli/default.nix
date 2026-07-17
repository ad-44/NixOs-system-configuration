{config, pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./foot.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    btop
    wev
    glow
    libsecret
    didyoumean
    pandoc
    sttr
  ];

  programs = {
    less.enable = true;
    yt-dlp.enable = true;
    fzf.enable = true;
    feh.enable = true;
    yazi = {
      enable = true;
      shellWrapperName = "y"; #fix legacy shell wrapper name
    };
    spotify-player.enable = true;
  };
}
