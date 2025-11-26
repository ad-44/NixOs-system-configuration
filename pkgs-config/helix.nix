{ pkgs, config, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language-server.texlab = with pkgs; {
        command = "${pkgs.texlab}/bin/texlab";
        config.texlab.build = {
          onSave = true;
          forwardSearchAfter = true;
          executable = "${pkgs.tectonic}/bin/tectonic";
          args = [
            "-X"
            "compile"
            "%f"
            "--synctex"
            "--keep-logs"
            "--keep-intermediates"
          ];
        };  
        config.texlab.forwardSearch = {
          executable = "${pkgs.sioyek}/bin/sioyek";
          args = [
            "--reuse-window"
            "--execute-command"
            "toggle_synctex"
            "texlab inverse-search -i \"%%1\" -l %%2"
            "--forward-search-file"
            "%f"
            "--forward-search-line"
            "%l"
            "%p"
          ];
        };  
      };
      language-server.ltex = with pkgs; {
        command = "${pkgs.ltex-ls-plus}/bin/ltex-ls-plus";
        config.ltex.dictionary = "fr";
      };
      language = [{
        name = "latex";
        language-servers = [
          "texlab"
          "ltex-ls-plus"
        ];
        file-types = ["tex"];
        auto-format = true;
      }];
    };
  };
}
