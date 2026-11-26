{ den, ... }:
{
  den.aspects.dev.android = {
    include = with den.aspects.dev.android; [
      studio
      adb
    ];

    studio.nixos = { user, pkgs, ... }: {
      environment.systemPackages = with pkgs; [ android-studio ];

      # Accept Android Studio EULA
      nixpkgs.config.android_sdk.accept_license = true;

      # Enable KVM for hardware-accelerated Android emulators
      users.users.${user.name}.extraGroups = [ "kvm" ];
    };

    adb.nixos = { user, pkgs, ... }: {
      environment.systemPackages = with pkgs; [ android-tools ];
      users.users.${user.name}.extraGroups = [ "adbusers" ];
    };
  };
}
