{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager = {
    enable = true;
    wifi ={
      backend = "wpa_supplicant";
    };

  };
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 
    2222 
    1865
  ];


  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];


  time.timeZone = "America/Tegucigalpa";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_HN.UTF-8";
    LC_IDENTIFICATION = "es_HN.UTF-8";
    LC_MEASUREMENT = "es_HN.UTF-8";
    LC_MONETARY = "es_HN.UTF-8";
    LC_NAME = "es_HN.UTF-8";
    LC_NUMERIC = "es_HN.UTF-8";
    LC_PAPER = "es_HN.UTF-8";
    LC_TELEPHONE = "es_HN.UTF-8";
    LC_TIME = "es_HN.UTF-8";
  };

  services.xserver.enable = true;

  services.gvfs = {
    enable = true;
  };

  services.samba = {
    enable = true;
    openFirewall = true;
  };
  services.samba-wsdd = {

    enable = true;
    openFirewall = true;
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome = {
    core-apps.enable = true;
    core-developer-tools.enable = true;
    gcr-ssh-agent.enable = false;
    gnome-keyring.enable = true;
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-termfilechooser
    ];

    config = {
      hyprland = {
        default = [
          "gtk"
          "hyprland"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      };
    };
  };

  environment.gnome = {
    excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
    ];
  };

  services.getty.autologinUser = "rimv";
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  services.printing ={
    enable = true;

    drivers = with pkgs; [
      epson-escpr
      epson-escpr2
    ];

    browsing = true;
    defaultShared = true;
  };


  services.avahi ={
    enable = true;

    nssmdns = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
  };
  services.udev = {
    enable = true;
    packages = with pkgs; [
      utsushi
    ];
  };

  # Scanner
  hardware.sane = {
    enable = true;
    extraBackends =with pkgs; [
      epkowa
      utsushi
    ];
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.localsend = {
    enable = true;

    openFirewall = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  users.users.rimv = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Raul Moncada";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp"];
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "rimv175";
      user.email = "rimv715@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    waybar
    btop
    swww
    opencode
    rofi
    wget
    pywal16
    ncspot
    neovim
    git
    wiremix
    lazygit
    fzf
    zoxide
    fish
    starship
    typstyle
    atuin
    bun
    bat
    cups
    nodejs
    vscode
    hypridle
    hyprlock
    hyprsunset
    hyprshot
    tinymist
    localsend
    gcc
    watchexec
    fd
    kitty
    tmux
    emacs
    cargo
    nodePackages.npm
    nodePackages.prettier
    bun
    acpi
    yarn
    pnpm
    vtsls
    xclip
    wl-clipboard
    clang-tools
    spotify
    ani-cli
    yazi
    dart-sass
    brightnessctl
    networkmanager
    libpulseaudio
    gobject-introspection
    mpv
    onlyoffice-desktopeditors
    home-manager
  ];

  fonts.packages = with pkgs; [
    iosevka
    monocraft
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
  ];

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
    ports = [ 2222 ];
  };

  programs.ssh = {
    startAgent = true;

    extraConfig = "
        Host github.com
                Hostname ssh.github.com
                Port 443
                User git
	";

  };

  system.stateVersion = "25.11"; # Did you read the comment?

}
