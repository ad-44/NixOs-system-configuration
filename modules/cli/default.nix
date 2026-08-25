{pkgs, inputs, ... }:

{
  imports = [
    ./aerc.nix
    ./bash.nix
    ./foot.nix
    ./gpg-cli.nix
    ./mail.nix
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
    oauth2l
    inputs.spotatui.packages.${pkgs.stdenv.hostPlatform.system}.default
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
  };
}
