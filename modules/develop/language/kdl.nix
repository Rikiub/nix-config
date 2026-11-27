{
  den.aspects.kdl.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [ kdlfmt ];

    # Editor Integration
    programs = {
      zed-editor = {
        extensions = [ "kdl" ];
        userSettings = {
          languages.Kdl.formatter.external = {
            command = "kdlfmt";
            arguments = [
              "format"
              "-"
            ];
          };
        };
      };

      fresh-editor = {
        settings = {
          languages.kdl.formatter = {
            command = "kdlfmt";
            args = [
              "format"
              "-"
            ];
          };
        };
      };
    };
  };
}
