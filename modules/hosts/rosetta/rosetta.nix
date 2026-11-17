{
  den.aspects.rosetta = { den, ... }: {
    includes = with den.aspects; [
      # System
      nixos

      # User
      desktop
      shell
      dev
      media
      gaming
    ];
  };
}
