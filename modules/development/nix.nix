{
  den.aspects.nix.homeManager =
    {
      pkgs,
      host,
      user,
      ...
    }:
    {
      # Toolchain
      home.packages = with pkgs; [
        nixd # LSP
        nil # LSP
        nixfmt # Nix Formatter
        statix # Nix Linter
      ];

      # Editor Integration
      programs =
        let
          nixd-settings = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import <nixpkgs> { }";
            options = {
              nixos.expr = "(builtins.getFlake \"${user.flakeDirectory}\").nixosConfigurations.${host.name}.options";
              home-manager.expr = "(builtins.getFlake \"${user.flakeDirectory}\").nixosConfigurations.${host.name}.options.home-manager.users.type.getSubOptions []";
              flake-parts.expr = "(builtins.getFlake \"${user.flakeDirectory}\").debug.options";
            };
          };
          nil-settings = {
            flake.autoArchive = true;
          };
        in
        {
          zed-editor = {
            extensions = [ "nix" ];
            userSettings = {
              lsp = {
                nil.settings = nil-settings;
                nixd.settings = nixd-settings;
              };
            };
          };

          fresh-editor.settings = {
            lsp.nix = [
              {
                enabled = true;
                auto_start = true;
                command = "nil";
                initialization_options = nil-settings;
              }
              {
                enabled = true;
                auto_start = true;
                command = "nixd";
                initialization_options = nixd-settings;
              }
            ];
          };
        };
    };
}
