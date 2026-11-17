{
  den.aspects.rosetta = { den, ... }: {
    includes = with den.aspects; [
      # System
      nixos

      # User
      desktop
      apps
      shell
      dev
      gaming
    ];
  };
}
