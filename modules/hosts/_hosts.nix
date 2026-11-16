let
  users = {
    rikiub = {
      name = "rikiub";
      label = "Rikiub";
      email = "rikiub.dev@gmail.com";
    };
  };
in
{
  rosetta = {
    system = "x86_64-linux";
    user = users.rikiub;
  };
}
