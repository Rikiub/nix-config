# Bootstrap base module

{ inputs, ... }:
{
  flake-file.inputs = {
    den.url = "github:denful/den";
  };

  imports = with inputs; [
    (flake-file.flakeModules.dendritic or { })
    (flake-parts.flakeModules.debug or { })
    (den.flakeModule or { })
  ];

  # Enable flake-parts debug for LSP
  debug = true;
}
