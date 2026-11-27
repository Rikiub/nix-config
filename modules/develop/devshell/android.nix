# Android environment for quick prototyping

{ inputs, ... }:
{
  perSystem =
    { system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };

      platformVersion = "35";
      abiVersion = "x86_64"; # matches the x86_64 host
      systemImageType = "google_apis"; # lighter than playstore, allows `adb root`
      deviceName = "pixel";

      sdkArgs = {
        includeEmulator = true;
        includeSystemImages = true;
        cmdLineToolsVersion = "8.0"; # hardcoded by emulateApp
        platformVersions = [ platformVersion ];
        systemImageTypes = [ systemImageType ];
        abiVersions = [ abiVersion ];
      };

      androidSdk = (pkgs.androidenv.composeAndroidPackages sdkArgs).androidsdk;

      android-emulator = pkgs.androidenv.emulateApp {
        name = "android-emulator";
        inherit
          platformVersion
          abiVersion
          systemImageType
          deviceName
          ;
        sdkExtraArgs = sdkArgs;

        # Keep the AVD between runs
        androidUserHome = "\${ANDROID_USER_HOME:-\${XDG_DATA_HOME:-$HOME/.local/share}/android}";

        # Only applied when the AVD is first created (delete it to re-apply).
        configOptions = {
          # Pixel 6-ish 1080x2400 @ ~420dpi; without these you get the tiny default skin.
          "hw.lcd.width" = "1080";
          "hw.lcd.height" = "2400";
          "hw.lcd.density" = "420";

          "hw.gpu.enabled" = "yes";
          "hw.gpu.mode" = "auto"; # fall back to "swiftshader_indirect" if it crashes

          "hw.keyboard" = "yes";
          "hw.ramSize" = "4096";
          "vm.heapSize" = "512";
          "disk.dataPartition.size" = "8G";
        };
      };
    in
    {
      devShells.android = pkgs.mkShell {
        packages = [
          android-emulator # run-test-emulator wrapper
          androidSdk # emulator/adb/sdkmanager/avdmanager + platforms;android-35
          pkgs.jdk17
        ];

        shellHook = ''
          export ANDROID_HOME="${androidSdk}/libexec/android-sdk"
          export ANDROID_SDK_ROOT="$ANDROID_HOME"
          export ANDROID_USER_HOME="''${ANDROID_USER_HOME:-''${XDG_DATA_HOME:-$HOME/.local/share}/android}"
          export ANDROID_AVD_HOME="''${ANDROID_AVD_HOME:-$ANDROID_USER_HOME/avd}"
          mkdir -p "$ANDROID_USER_HOME" "$ANDROID_AVD_HOME"

          echo "💡 Start emulator with 'run-test-emulator' or 'emulator -avd ${deviceName}'."
        '';
      };
    };

  den.default.nixos = { user, ... }: {
    users.users.${user.name}.extraGroups = [ "kvm" ];

    networking.firewall.allowedTCPPorts = [
      8081 # Metro / Expo
    ];
  };
}
