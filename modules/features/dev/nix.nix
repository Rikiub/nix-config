{
  den.aspects.nix.homeManager =
    {
      pkgs,
      host,
      config,
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
      programs.zed-editor = {
        extensions = [ "nix" ];
        userSettings =
          let
            flakeDir = "${config.xdg.configHome}/nixos";
          in
          {
            lsp.nixd.settings = {
              formatting.command = [ "nixfmt" ];
              nixpkgs.expr = "import <nixpkgs> { }";
              options = {
                nixos.expr = "(builtins.getFlake \"${flakeDir}\").nixosConfigurations.${host.name}.options";
                home-manager.expr = "(builtins.getFlake \"${flakeDir}\").nixosConfigurations.${host.name}.options.home-manager.users.type.getSubOptions []";
                flake-parts.expr = "(builtins.getFlake \"${flakeDir}\").debug.options";
              };
            };
          };
      };
    };
}
