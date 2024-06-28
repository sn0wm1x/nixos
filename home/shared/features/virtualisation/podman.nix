{ config
, lib
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    boxbuddy # https://github.com/Dvlv/BoxBuddyRS
    distrobox
    dive # look into docker image layers
    # lazydocker
    docker-compose # start group of containers for dev
    podman-tui # status of containers in the terminal
    pods # https://github.com/marhkb/pods
  ];
  home.shellAliases = {
    docker-compose = "podman-compose";
  };

  xdg.configFile."pods/connections.json".text = builtins.toJSON {
    "21950ebf-11f6-4f6a-bfe8-10ea6b174e9c" = {
      uuid = "21950ebf-11f6-4f6a-bfe8-10ea6b174e9c";
      name = "Podman";
      url = "unix:///run/user/1000/podman/podman.sock";
      rgb = null;
    };
  };

  # xdg.configFile."distrobox/distrobox.ini".text = lib.generators.toINI { } {
  #   arch = {
  #     image = "archlinux:latest";
  #     packages = "base-devel";
  #     pull = true;
  #   };
  #   arch = {
  #     image = "ghcr.io/ublue-os/arch-distrobox";
  #   };
  #   bazzite-arch = {
  #     image = "ghcr.io/ublue-os/bazzite-arch-gnome";
  #   };
  # };

  home.persistence."/persist${config.home.homeDirectory}".directories = [
    ".local/share/containers"
  ];
}
