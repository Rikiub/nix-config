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
      direnv
      git
      just
    ];
  };
}
