{
  den.aspects.apps = { den, ... }: {
    includes = with den.aspects; [
      kde
      obsidian
      ghostty
      firefox
      discord
      zed-editor
    ];
  };
}
