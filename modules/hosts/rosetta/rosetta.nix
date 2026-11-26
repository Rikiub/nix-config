{ den, ... }:
{
  den.aspects.rosetta = {
    includes = with den.aspects; [
      # NixOS
      system

      # User
      desktop
      apps
      terminal
      develop
      gaming
    ];
  };

  den.hosts.x86_64-linux.rosetta =
    let
      dataDrive = {
        mount = "/media/Datos";
        root = "${dataDrive.mount}/Raiz";

        backups = "${dataDrive.root}/Respaldos";
        home = "${dataDrive.root}/Usuario";
      };
    in
    {
      # Variables
      inherit dataDrive;

      # Users
      users.rikiub = { };
    };
}
