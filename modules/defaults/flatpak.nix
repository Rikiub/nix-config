{
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  # Any aspect can declare flatpak packages
  den.default = {
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
