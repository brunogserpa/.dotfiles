{
  inputs,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  home.packages = with pkgs; [
    spotify
    vesktop
    teams-for-linux
    slack
    firefox
    barrier
    gimp
    cool-retro-term
    kitty
    audacity
    ripgrep
    zellij
    cmake

    unzip
    killall
    stylua
    nodePackages.prettier
    
    hyprpaper
    hyprpicker
    waybar
    wl-clipboard
    grim
    slurp
    htop
    lshw
    ffmpeg
    xdg-desktop-portal-hyprland
    starship
    chromium
    nix-your-shell

    pulseaudio
    pamixer
    pavucontrol
    alsa-utils

    unstable.neovim
    jetbrains.clion
    vscode
    code-cursor
    nodejs
    docker-compose
    awscli2
    clang
    gnumake
    circleci-cli

    cypress
    jetbrains-mono
    material-icons
    material-design-icons
    noto-fonts
    papirus-icon-theme
    font-awesome

    (let
      python3-with-packages = pkgs.python3.withPackages (p:
        with p; [
          pip
        ]);
    in
      python3-with-packages)
  ];
}

