{
  den.aspects.nixos = { den, ... }: {
    includes = with den.aspects; [
      # Core
      boot
      system-shell
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
