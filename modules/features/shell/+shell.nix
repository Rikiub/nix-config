{
  flake.aspects = { aspects, ... }: {
    shell = {
      includes = with aspects; [
        apps-shell
        bat
        clipboard-shell
        fresh-editor
        tldr
        yazi
        nx
        nushell # Interactive Shell
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
