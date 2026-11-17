{
  den.aspects.shell = { den, ... }: {
    includes = with den.aspects; [
      common-shell
      clipboard-shell
      fresh-editor
      bat
      nx
      opencode
      nushell # Interactive Shell
    ];
  };
}
