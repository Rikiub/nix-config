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

      develop.firewall
      direnv
      git
      just
    ];
  };
}
