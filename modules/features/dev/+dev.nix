{
  den.aspects.dev = { den, ... }: {
    includes = with den.aspects; [
      direnv
      git
      just
      lsp-common
      nix
      nodejs
      python
    ];
  };
}
