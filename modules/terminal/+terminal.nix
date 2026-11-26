{ den, ... }:
{
  den.aspects.terminal = {
    includes = with den.aspects; [
      cli
      clipboard
      bat
      opencode
      nushell # Interactive Shell
    ];
  };
}
