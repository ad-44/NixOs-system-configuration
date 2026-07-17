{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ad-44";
        email = "antoine.debille@gmail.com";  
      };
      init.defaultBranch = "main";
    };
  };
}
