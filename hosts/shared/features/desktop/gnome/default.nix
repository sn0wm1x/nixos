{ pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.xterm.enable = false;

  environment.systemPackages = with pkgs; [
    gnome.dconf-editor
    gnome.gnome-shell-extensions
    gnome.gnome-tweaks
    # 功能
    gnomeExtensions.vitals
    gnomeExtensions.kimpanel
    gnomeExtensions.gsconnect
    #
    gnomeExtensions.paperwm
    gnomeExtensions.dash-to-dock
    gnomeExtensions.quick-settings-tweaker
    # 外观
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.gnome-40-ui-improvements
  ];
}
