{ den, ... }:
{
  den.aspects.shell = {
    includes = with den.aspects; [
      common-shell
      clipboard-shell
      fresh-editor
      bat
      nx
      nushell # Interactive Shell
    ];

    nixos = { };
    homeManager = { };
  };
}
