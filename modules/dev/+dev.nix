{
  den.aspects.dev = { den, ... }: {
    includes = with den.aspects; [
      # Editors
      zed-editor # GUI
      fresh-editor # TUI

      direnv
      git
      just
      lsp
      nix
      nodejs
      python
    ];
  };
}
