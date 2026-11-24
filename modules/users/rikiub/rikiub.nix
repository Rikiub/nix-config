{ den, ... }:
{
  den.aspects.rikiub = {
    includes = with den.batteries; [ primary-user ];
  };
}
