{
  den.aspects.hardware.bluetooth.nixos = { ... }: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
