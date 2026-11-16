{
  flake.aspects = { aspects, ... }: {
    shell = {
      includes = with aspects; [
        common-shell
        clipboard-shell
        fresh-editor
        bat
        nx
        nushell # Interactive Shell
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
