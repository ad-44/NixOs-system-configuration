{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = ["fr"];
  };
}
