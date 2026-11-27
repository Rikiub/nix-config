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

      android-emulator = pkgs.androidenv.emulateApp {
        name = "android-emulator";

        platformVersion = "35";
        abiVersion = "x86_64";
        systemImageType = "google_apis_playstore"; # or "google_apis" without Play Store
        deviceName = "pixel";

        # Keep the AVD between runs
        androidUserHome = "\${ANDROID_USER_HOME:-\${XDG_DATA_HOME:-$HOME/.local/share}/android}";

        configOptions = {
          "hw.gpu.enabled" = "yes";
          "hw.gpu.mode" = "host"; # fall back to "swiftshader_indirect" if it crashes
        };
      };
    in
    {
      devShells.android = pkgs.mkShell {
        packages = with pkgs; [
          android-emulator # Custom Emulator
          android-tools # adb/fastboot on PATH
          gradle # build apps with Gradle
          jdk17 # build apps with Gradle
        ];

        shellHook = ''
          echo "💡 Start emulator with 'run-test-emulator'."
        '';
      };
    };

  den.default.nixos = { user, ... }: {
    # Enable KVM for hardware-accelerated Android emulators
    users.users.${user.name}.extraGroups = [
      "kvm"
      "adbusers"
    ];

    # Ports for external tooling
    networking.firewall.allowedTCPPorts = [
      8081 # Expo Go
    ];
  };
}
