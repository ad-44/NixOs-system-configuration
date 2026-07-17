{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    dolphin-emu

    (retroarch.withCores (cores: with cores; [
      gambatte
      mgba
      mupen64plus
      genesis-plus-gx
    ]))
  ];

}
