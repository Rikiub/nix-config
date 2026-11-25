{ den, ... }:
{
  den.aspects.nixos = {
    includes = with den.aspects; [
      # Core
      boot
      default-shell
      clean
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
