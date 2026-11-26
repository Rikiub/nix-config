{ den, ... }:
{
  den.aspects.terminal = {
    includes = with den.aspects; [
      bat
      cli
      clipboard
      nushell # Interactive Shell
    ];
  };
}
