{ config, pkgs, lib, ... }:

{
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.black-formatter
      ms-python.python
      njpwerner.autodocstring
      mkhl.direnv
      ltex-plus.vscode-ltex-plus
      james-yu.latex-workshop
    ];
  };
}
