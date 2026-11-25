# Force common apps to follow XDG base directories

{
  den.default = {
    nixos = { ... }: {
      nix.settings.use-xdg-base-directories = true;
    };

    homeManager = { config, ... }: {
      xdg = {
        enable = true; # Enable XDG base directories
        mimeApps.enable = true; # Allow aspects to set default apps
        localBinInPath = true; # Add ~/.local/bin to PATH.
      };

      home = {
        preferXdgDirectories = true;
        sessionVariables = {
          # shell
          HISTFILE = "${config.xdg.cacheHome}/bash/history";

          # java
          _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";
          GRADLE_USER_HOME = "${config.xdg.cacheHome}/gradle";

          # rust
          RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
          CARGO_HOME = "${config.xdg.cacheHome}/cargo";

          # go
          GOPATH = "${config.xdg.cacheHome}/go";

          # python
          PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/cpython";

          # node / npm
          npm_config_cache = "${config.xdg.cacheHome}/npm";
          NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
          NODE_REPL_HISTORY = "${config.xdg.dataHome}/node/node_repl_history";

          # deno
          DENO_DIR = "${config.xdg.cacheHome}/deno-cache";
          DENO_INSTALL_ROOT = "${config.xdg.cacheHome}/deno";

          # elm
          ELM_HOME = "${config.xdg.cacheHome}/elm";

          # haskell
          CABAL_DIR = "${config.xdg.cacheHome}/cabal";
          CABAL_CONFIG = "${config.xdg.configHome}/cabal/config";
          STACK_ROOT = "${config.xdg.cacheHome}/stack";

          # racket
          PLTUSERHOME = "${config.xdg.cacheHome}/racket";

          # dotnet
          NUGET_PACKAGES = "${config.xdg.cacheHome}/NuGetPackages";

          # ruby (solargraph)
          SOLARGRAPH_CACHE = "${config.xdg.cacheHome}";

          # gnupg
          GNUPGHOME = "${config.xdg.dataHome}/gnupg";

          # aws
          AWS_SHARED_CREDENTIALS_FILE = "${config.xdg.configHome}/aws/credentials";
          AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";

          # postgres
          PSQLRC = "${config.xdg.configHome}/pg/psqlrc";
          PSQL_HISTORY = "${config.xdg.dataHome}/pg/psql_history";
          PGPASSFILE = "${config.xdg.cacheHome}/pg/pgpass";
          PGSERVICEFILE = "${config.xdg.cacheHome}/pg/pg_service.conf";

          # mysql
          MYSQL_HISTFILE = "${config.xdg.dataHome}/mysql/history";

          # redis
          REDISCLI_HISTFILE = "${config.xdg.dataHome}/redis/rediscli_history";
          REDISCLI_RCFILE = "${config.xdg.configHome}/redis/redisclirc";

          # sqlite
          SQLITE_HISTORY = "${config.xdg.dataHome}/sqlite/sqlite_history";

          # less
          LESSKEY = "${config.xdg.cacheHome}/less/key";
          LESSHISTFILE = "${config.xdg.dataHome}/less/history";

          # gtk
          GTK_RC_FILES = "${config.xdg.configHome}/gtk-1.0/gtkrc";
          GTK2_RC_FILES = "${config.xdg.configHome}/gtk-2.0/gtkrc";

          # x11
          XCOMPOSEFILE = "${config.xdg.cacheHome}/X11/xcompose";
          XCOMPOSECACHE = "${config.xdg.cacheHome}/X11/xcompose";
          ERRFILE = "${config.xdg.dataHome}/X11/xsession-errors";
        };
      };
    };
  };
}
