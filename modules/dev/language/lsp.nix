{ den, ... }:
{
  den.aspects.lsp = {
    includes = with den.aspects.lsp; [ _ ];

    tools.homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        bash-language-server # Bash
        vscode-json-languageserver # JSON
        yaml-language-server # YAML
        taplo # TOML
      ];
    };

    editor.homeManager = { ... }: {
      programs.zed-editor.extensions = [
        "toml"
        "lua"
      ];
    };
  };
}
