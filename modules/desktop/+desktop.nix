{ den, ... }:
{
  den.aspects.desktop = {
    includes = with den.aspects; [
      desktop.niri
      gnome-keyring
    ];
  };
}
