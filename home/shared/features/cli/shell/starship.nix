{
  # TODO: https://github.com/catppuccin/starship
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = true;
    character = {
      success_symbol = "[➜](bold green)";
      error_symbol = "[➜](bold red)";
    };
  };
}