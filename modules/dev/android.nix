{
  den.aspects.dev.android.nixos = { user, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      android-studio
      android-tools
    ];

    # Accept Android Studio EULA
    nixpkgs.config.android_sdk.accept_license = true;

    # Enable KVM for hardware-accelerated Android emulators
    users.users.${user.name}.extraGroups = [
      "kvm"
      "adbusers"
    ];
  };
}
