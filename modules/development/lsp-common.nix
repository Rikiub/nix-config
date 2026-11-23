{
  den.aspects.lsp-common.homeManager = { pkgs, ... }: {
    # Toolchain
    home.packages = with pkgs; [
      bash-language-server # Bash

      vscode-json-languageserver # JSON
      yaml-language-server # YAML
      taplo # TOML
    ];

    # Editor Integration
    programs.zed-editor.extensions = [
      "toml"
      "lua"
      "kdl"
    ];
  };
}
