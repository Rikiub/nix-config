{ den, ... }:
{
  den.aspects.nix = {
    includes = with den.aspects.nix; [ _ ];

    tools.homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        nix-prefetch-github
      ];
    };

    editor.homeManager =
      {
        pkgs,
        host,
        user,
        ...
      }:
      let
        lsp = {
          nixd = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import <nixpkgs> { }";
            options = {
              nixos.expr = "(builtins.getFlake \"${user.flakeDirectory}\").nixosConfigurations.${host.name}.options";
              home-manager.expr = "(builtins.getFlake \"${user.flakeDirectory}\").nixosConfigurations.${host.name}.options.home-manager.users.type.getSubOptions []";
              flake-parts.expr = "(builtins.getFlake \"${user.flakeDirectory}\").debug.options";
            };
          };
          nil = {
            flake.autoArchive = true;
          };
        };
      in
      {
        home.packages = with pkgs; [
          nixd # LSP
          nil # LSP
          nixfmt # Nix Formatter
          statix # Nix Linter
        ];

        # Editor Integration
        programs = {
          zed-editor = {
            extensions = [ "nix" ];
            userSettings = {
              lsp = {
                nil.settings = lsp.nil;
                nixd.settings = lsp.nixd;
              };
            };
          };

          fresh-editor.settings = {
            lsp.nix = [
              {
                enabled = true;
                auto_start = true;
                command = "nil";
                initialization_options = lsp.nil;
              }
              {
                enabled = true;
                auto_start = true;
                command = "nixd";
                initialization_options = lsp.nixd;
              }
            ];
          };
        };
      };
  };
}
