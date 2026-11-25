{ den, ... }:
{
  den.aspects.python = {
    includes = with den.aspects.python; [ _ ];

    tools.homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        python3 # Python system-wide
      ];
      programs.uv.enable = true; # Python Toolchain
    };

    editor.homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        ty # LSP
      ];

      # Editor Integration
      programs = {
        zed-editor = {
          extensions = [ "python" ];
          userSettings = {
            languages.Python.language_servers = [
              "ty"
              "!basedpyright"
              "!pyrefly"
              "..."
            ];
          };
        };

        fresh-editor.settings = {
          lsp.python = [
            {
              enabled = true;
              auto_start = true;
              command = "ty";
              args = [ "server" ];
            }
          ];
        };
      };
    };
  };
}
