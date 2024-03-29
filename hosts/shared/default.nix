{lib, ...}: {
  imports = [
    ./btrfs.nix
    ./fonts.nix
    ./gpg.nix
    ./locale.nix
    ./nix.nix
    ./ssh.nix
  ];

  zramSwap.enable = true;

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = lib.mkDefault "23.11";
}
