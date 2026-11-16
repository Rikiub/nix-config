{
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  den.aspects.flatpak = {
    nixos = { inputs, ... }: {
      imports = [
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];
      services.flatpak.enable = true;
    };

    homeManager = { inputs, ... }: {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];
    };
  };
}
