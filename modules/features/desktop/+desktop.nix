{ den, ... }:
{
  den.aspects.desktop = {
    includes = with den.aspects; [
      niri-desktop
      gnome-keyring
    ];

    nixos = { };
    homeManager = { };
  };
}
