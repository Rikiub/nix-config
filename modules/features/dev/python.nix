{
  den.aspects.python = {
    homeManager = { pkgs, ... }: {
      # Toolchain
      home.packages = with pkgs; [
        python3 # Python system-wide
        ty # LSP
      ];
      programs.uv.enable = true; # Python Toolchain

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
