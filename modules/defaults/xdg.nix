# Force common apps to follow XDG base directories

{
  den.default = {
    nixos = { ... }: {
      nix.settings.use-xdg-base-directories = true;
    };

    homeManager = { config, ... }: {
      xdg = {
        enable = true; # Enable XDG base directories
        localBinInPath = true; # Add ~/.local/bin to PATH.
        mimeApps.enable = true; # Allow aspects to set default apps
      };

      home = {
        preferXdgDirectories = true;
        sessionVariables = {
          _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";

          GOPATH = "${config.xdg.dataHome}/go";
          CARGO_HOME = "${config.xdg.dataHome}/cargo";
          RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
          GNUPGHOME = "${config.xdg.dataHome}/gnupg";

          npm_config_cache = "${config.xdg.cacheHome}/npm";
          HISTFILE = "${config.xdg.cacheHome}/bash/history";
          PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/cpython";
        };
      };
    };
  };
}
