{ den, ... }:
{
  den.aspects.nixos = {
    includes = with den.aspects; [
      # Core
      bootloader
      kernel
      locale
      nix
      vm

      # Programs
      fuse
      nix-ld
      ssh
      sudo
    ];
  };
}
