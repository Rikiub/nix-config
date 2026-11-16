{
  den.aspects.nix.homeManager = { pkgs, ... }: {
    # Toolchain
    home.packages = with pkgs; [
      nixd # LSP
      nil # LSP
      nixfmt # Nix Formatter
      statix # Nix Linter
    ];

    # Editor Integration
    programs.zed-editor.extensions = [ "nix" ];
  };
}
