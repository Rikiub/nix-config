{ den, ... }:
{
  den.aspects.nixos = {
    includes = with den.aspects; [
      # Core
      boot
      system-shell
      clean
      kernel
      locale
      nix
      #users
      vm

      # Programs
      fuse
      nix-ld
      ssh
      sudo
    ];

    nixos = { };
    homeManager = { };
  };
}
