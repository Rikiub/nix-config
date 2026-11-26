{
  den.aspects.dev.android.nixos = { user, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      android-tools
    ];

    # Enable KVM for hardware-accelerated Android emulators
    users.users.${user.name}.extraGroups = [
      "kvm"
      "adbusers"
    ];
  };
}
