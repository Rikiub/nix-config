{ den, ... }:
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

  den.aspects.rosetta = {
    includes = with den.aspects; [
      # System
      nixos

      # User
      desktop.niri
      apps
      shell
      dev
      gaming
    ];
  };
}
