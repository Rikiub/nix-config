# Any aspect can declare flatpak packages

{ inputs, ... }:
{
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  den.default = {
    nixos = { ... }: {
      imports = [
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];
      services.flatpak.enable = true;
    };

    homeManager = { ... }: {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];
    };
  };
}
