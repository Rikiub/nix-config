{ den, ... }:
{
  den.aspects.develop = {
    includes = with den.aspects; [
      # AI
      opencode

      # Editor
      zed-editor # GUI
      fresh-editor # TUI

      # Language
      # kdl
      lsp
      nix
      nodejs
      python

      # Tools
      dev-ports
      direnv
      git
      just
    ];
  };
}
