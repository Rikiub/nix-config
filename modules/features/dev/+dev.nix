{ den, ... }:
{
  den.aspects.dev = {
    includes = with den.aspects; [
      direnv
      git
      just
      lsp-common
      nix
      nodejs
      python
    ];

    nixos = { };
    homeManager = { };
  };
}
