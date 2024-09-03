{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.file.".config/alacritty/alacritty.toml" = {
    source = ../../configs/alacritty/alacritty.toml;
    recursive = false;
  };
  home.file.".config/starship.toml" = {
    source = ../../configs/alacritty/starship.toml;
    recursive = false;
  };
  home.file.".config/dunst/dunstrc" = {
    source = ../../configs/dunst/dunstrc;
    recursive = false;
  };
  home.file.".config/nvim" = {
    source = ../../configs/nvim;
    recursive = true;
  };
  home.file.".config/picom.conf" = {
    source = ../../configs/picom/picom.conf;
    recursive = false;
  };
  home.file.".config/rofi" = {
    source = ../../configs/rofi;
    recursive = true;
  };
  home.file.".config/hypr" = {
    source = ../../configs/hypr;
    recursive = true;
  };
  home.file.".config/waybar" = {
    source = ../../configs/waybar;
    recursive = true;
  };
  home.file.".zshrc" = {
    source = ../../configs/zsh/.zshrc;
    recursive = true;
  };
}
