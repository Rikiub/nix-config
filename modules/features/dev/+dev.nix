{ den, ... }:
{
  den.aspects.dev = {
    includes = with den.aspects; [
      direnv
      git
      just
      lsp
      nix
      nodejs
      python
    ];

    nixos = { };
    homeManager = { };
  };
}
