{ den, ... }:
{
  den.aspects.system = {
    includes = with den.aspects.system; [
      # Core
      bootloader
      kernel
      locale
      misc
      vm

      # Programs
      fuse
      nix-ld
      ssh
      sudo
    ];
  };
}
