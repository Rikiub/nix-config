/**
  nixos-hardware

  Check available modules in:
  https://github.com/NixOS/nixos-hardware/blob/ec39df522f291a1da3bee80d3ff67d99c57a17b0/flake.nix#L466-L498

  # Example

  ```nix
  { inputs, ... }:
  {
    den.aspects.<hostname>.nixos = { ... }: {
      imports = with inputs.nixos-hardware.nixosModules; [
        common-pc-laptop
        common-pc-ssd
        common-cpu-intel
        common-gpu-nvidia
        ...
      ];
    };
  }
  ```
*/

{
  flake-file.inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };
}
