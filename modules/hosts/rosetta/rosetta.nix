let
  dataDrive = {
    mount = "/media/Datos";
    root = "${dataDrive.mount}/Raiz";

    backups = "${dataDrive.root}/Respaldos";
    home = "${dataDrive.root}/Usuario";
  };
in
{
  den.hosts.x86_64-linux.rosetta = {
    # Variables
    inherit dataDrive;

    # Users
    users.rikiub = { };
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
