{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "html"
      "latex"
    ];

    userSettings = {
      load_direnv = "direct";
     
      lsp = {
        texlab = {
          settings = {
            texlab = {
              build = {
                onSave = true;
                executable = "latexmk";
                args = [
                  "-pdf"
                  "-interaction=nonstopmode"
                  "-synctex=1"
                  "%f"
                ];
              };
            };
          };
        };
      };

    };

  };
}
