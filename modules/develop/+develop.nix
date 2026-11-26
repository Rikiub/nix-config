{ den, ... }:
{
  den.aspects.develop = {
    includes = with den.aspects; [
      # Editors
      zed-editor # GUI
      fresh-editor # TUI

      # kdl
      lsp
      nix
      nodejs
      python

      dev-ports
      direnv
      git
      just
    ];
  };
}
