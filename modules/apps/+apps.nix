{
  den.aspects.apps = { den, ... }: {
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
