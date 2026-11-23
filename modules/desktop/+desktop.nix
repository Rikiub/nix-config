{
  den.aspects.desktop = { den, ... }: {
    includes = with den.aspects; [
      niri-desktop
      gnome-keyring
    ];
  };
}
