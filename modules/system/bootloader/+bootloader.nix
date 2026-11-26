{ den, ... }:
{
  den.aspects.system.bootloader = {
    includes = with den.aspects.system; [
      limine
      plymouth
    ];
  };
}
