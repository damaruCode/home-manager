{ inputs, pkgs, ... }:
{
  imports = [
    ./features/hypr.nix # window manager config
    ./features/kitty.nix # terminal emulator config
    ./features/nvim.nix # editor config
    ./features/zsh.nix # shell config
    ./features/rofi.nix # app launcher config
    ./features/waybar.nix # status bar config
    ./features/zathura.nix # pdf reader config
    ./features/feh.nix # img viewer config
    ./features/xdg.nix # defaults programs for file endings
    ./features/fonts.nix # font config
    ./features/compilers.nix # compiler config
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "damaru";
    homeDirectory = "/home/damaru";
    packages = with pkgs; [
      hyprpaper # wallpaper daemon
      swaylock-effects # screen locker
      wl-clipboard # clipboard for wayland
      pavucontrol # volume control
      htop-vim # task viewer

      # standalone apps
      brave # browser
      slack # communication
      discord # communication

      # for neovim
      ripgrep
      tree-sitter
    ];
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
