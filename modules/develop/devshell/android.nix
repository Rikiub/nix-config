# Android DevShell for quick prototyping
# Enter with `just develop android` and `run-test-emulator`.

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

      emulator = pkgs.androidenv.emulateApp {
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
      packages.android-emulator = emulator;

      devShells.android = pkgs.mkShell {
        packages = [
          emulator
          pkgs.android-tools # adb/fastboot on PATH
          pkgs.jdk17 # only if you build apps with Gradle
        ];
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
