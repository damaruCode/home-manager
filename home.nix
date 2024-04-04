{ pkgs, ... }:
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
    ./features/eduroam.nix # eduroam config
    ./features/minecraft.nix # minecraft config
    ./features/lutris.nix # game manager config
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" # for obsidian
  ];

  home = {
    username = "damaru";
    homeDirectory = "/home/damaru";
    packages = with pkgs; [
      # standalone apps
      brave # browser
      slack # communication
      figma-linux # design
      discord # communication
      webcord # discord in browser
      obsidian # note taking
      libreoffice # office suite
      gnuplot # plotting
      inkscape # vector graphics
      gimp # image editing
      krita # digital painting
      vlc # media player

      # utils
      htop-vim # task viewer
      pavucontrol # volume control
      wl-clipboard # clipboard for wayland
    ];
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
