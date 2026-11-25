{ den, ... }:
{
  den.aspects.apps = {
    includes = with den.aspects; [
      kde.apps
      obsidian
      ghostty
      firefox
      discord
      zed-editor
    ];
  };
}
