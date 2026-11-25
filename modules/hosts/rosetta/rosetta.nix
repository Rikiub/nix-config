{
  den.hosts.x86_64-linux.rosetta.users = {
    rikiub = { };
  };

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
