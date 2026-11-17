{
  den.aspects.shell = { den, ... }: {
    includes = with den.aspects; [
      common-shell
      clipboard-shell
      bat
      nx
      opencode
      nushell # Interactive Shell
    ];
  };
}
