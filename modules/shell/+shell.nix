{ den, ... }:
{
  den.aspects.shell = {
    includes = with den.aspects; [
      shell.cli
      shell.clipboard
      bat
      opencode
      nushell # Interactive Shell
    ];
  };
}
