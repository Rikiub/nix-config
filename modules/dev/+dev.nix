{ den, ... }:
{
  den.aspects.dev = {
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
