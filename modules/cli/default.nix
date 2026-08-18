{pkgs, inputs, ... }:

let
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in
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
    unstable.spotatui
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
