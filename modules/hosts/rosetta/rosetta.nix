{ den, ... }:
{
  den.aspects = {
    rosetta = {
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

      nixos = { };
      homeManager = { };
    };
  };
}
