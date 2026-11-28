{ den, ... }:
{
  den.aspects.kde = {
    includes = with den.aspects.kde; [ apps ];

    apps = {
      includes = with den.aspects.kde; [
        kclock
        dolphin
        partition-manager
      ];

      homeManager = { pkgs, ... }: {
        # Common Apps

        home.packages = with pkgs; [
          haruna # Video Player
          kdePackages.elisa # Music Player
          kdePackages.koko # Image Viewer
          kdePackages.okular # PDF Viewer
          kdePackages.kalk # Calculator
        ];

        # Set default apps
        xdg.mimeApps.defaultApplications = {
          "video/*" = "org.kde.haruna.desktop";
          "audio/*" = "org.kde.elisa.desktop";
          "image/*" = "org.kde.koko.desktop";
          "application/pdf" = "org.kde.okular.desktop";
        };
      };
    };

    partition-manager = {
      # KDE Partition Manager
      nixos = { ... }: {
        programs.partition-manager.enable = true;
      };
    };

    kclock = {
      # KDE Clock
      nixos = { ... }: {
        programs.kclock.enable = true;
      };

      homeManager = { pkgs, ... }: {
        home.packages = with pkgs; [ kdePackages.kclock ];
      };
    };

    dolphin = {
      nixos = { pkgs, ... }: {
        services.udisks2.enable = true; # For show drives

        # Fix "Open With" menu
        environment.etc."xdg/menus/applications.menu".source =
          "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
      };

      homeManager = { pkgs, ... }: {
        home.packages = with pkgs; [
          kdePackages.dolphin # File Manager
          kdePackages.ark # Zip Manager

          kdePackages.kio # needed since 25.11
          kdePackages.kio-fuse # to mount remote filesystems via FUSE
          kdePackages.kio-extras # extra protocols support (sftp, fish and more)

          gdk-pixbuf # Image Thumbnails
          ffmpegthumbnailer # Video Thumbnails
          kdePackages.kdegraphics-thumbnailers # PDF Thumbnails
        ];

        # Set Dolphin as default
        xdg.mimeApps.defaultApplications = {
          "inode/directory" = "org.kde.dolphin.desktop";
        };

        xdg.portal = {
          enable = true;
          extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
          config.common."org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
        };
      };
    };
  };
}
