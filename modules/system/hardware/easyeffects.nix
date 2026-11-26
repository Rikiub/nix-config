{
  den.aspects.hardware.easyeffects = {
    nixos = { ... }: {
      programs.dconf.enable = true;
    };

    homeManager = { ... }: {
      services.easyeffects.enable = true;
    };
  };
}
