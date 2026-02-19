{ pkgs, config, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor= {
        soft-wrap.enable = true;
        idle-timeout = 0;
        completion-trigger-len = 1;
      };
    };
    
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

      language-server.ruff = with pkgs; {
        command = "${pkgs.ruff}/bin/ruff";
        args = ["server"];
      };

      language-server.pyright = with pkgs; {
        command = "${pkgs.pyright}/bin/pyright";
        config = {
          python.analysis = {
            typeCheckingMode = "basic";
          };
        };
      };

      language-server.pylsp = {
        command = "${pkgs.python313Packages.python-lsp-server}/bin/pylsp";
        args = [];
      };

      language-server.marksman = {
        command = "${pkgs.marksman}/bin/marksman";
      };

      language-server.mpls = {
        command = "${pkgs.mpls}/bin/mpls";
        args = [];
      };
      
      language = [
        {
        name = "latex";
        language-servers = [
          "texlab"
          "ltex-ls-plus"
        ];
        file-types = ["tex"];
        auto-format = true;
        }
        
        {
        name = "python";
        language-servers = [
          # "ruff"
          # "pyright"
          "pylsp"
        ];
        file-types = ["py"];
        auto-format = true;   
        }

        {
        name = "markdown";
        language-servers = [
          "marksman"
          "mpls"
        ];
        file-types = ["md"];
        auto-format = true;
        }
        
      ];   
    };
  };
}
