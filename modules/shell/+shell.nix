{
  den.aspects.shell = { den, ... }: {
    includes = with den.aspects; [
      common-shell
      clipboard-shell
      bat
      opencode
      nushell # Interactive Shell
    ];
  };
}
