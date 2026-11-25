{
  den.aspects.desktop = { den, ... }: {
    includes = with den.aspects; [
      desktop.niri
      gnome-keyring
    ];
  };
}
