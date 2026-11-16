{ den, ... }:
{
  den.aspects.media = {
    includes = with den.aspects; [
      kde-apps
      obsidian
      ghostty
      firefox
      discord
      zed-editor
    ];

    nixos = { };
    homeManager = { };
  };
}
