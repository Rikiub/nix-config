{ den, ... }:
{
  den.aspects.dev = {
    includes = with den.aspects; [
      # Editors
      zed-editor # GUI
      fresh-editor # TUI

      # kdl
      lsp
      nix
      nodejs
      python

      dev.firewall
      dev.android._
      direnv
      git
      just
    ];
  };
}
