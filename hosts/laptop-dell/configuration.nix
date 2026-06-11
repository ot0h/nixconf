{
  inputs,
  pkgs,
  ...
}: let
  # HyprlandPackageFlake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  # PortalHyprlandFlake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
in {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  # Mas cosas del Hardware
  hardware.enableRedistributableFirmware = true;

  # Cosas relacionadas al Fimware
  services.fwupd.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth.enable = true;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager = {
    enable = true;
    wifi = {
      backend = "wpa_supplicant";
    };
  };
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [22 80 2222 1865 3289 8022];
  };

  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

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

  services.flatpak.enable = true;
  services.libinput.enable = true;
  services.xserver.enable = false;

  services.gvfs = {
    enable = true;
  };

  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = false;
  services.getty.autologinUser = "rimv";

  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    gcr-ssh-agent.enable = false;
    gnome-keyring.enable = true;
  };

  security.pam.services.hyprland.enableGnomeKeyring = true;

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
          "sway"
        ];
        "org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
      };
    };
  };

  environment.gnome = {
    excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
    ];
  };

  programs.hyprland = with pkgs; {
    enable = true;
    xwayland.enable = true;
    package = hyprland;
    portalPackage = xdg-desktop-portal-hyprland;
  };

  programs.sway = with pkgs; {
    enable = true;
    package = swayfx;
  };

  # services.xserver.xkb = {
  #   layout = "latam";
  #   variant = "";
  # };

  console.keyMap = "la-latin1";

  services.udev = {
    enable = true;
    packages = with pkgs; [
      # utsushi
    ];
  };

  # Scanner
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      epkowa
      # utsushi

      (writeTextFile {
        name = "epson2.conf";
        text = ''
          net  192.168.123.26
        '';
        destination = "/etc/sane.d/epson2.conf";
      })
    ];
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
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
    extraGroups = ["networkmanager" "wheel" "scanner" "lp"];
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "numbpi";
      user.email = "rimv715@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      core.pager = "delta";
    };
  };

  # Los paquetes de usuario ahora están en home.nix

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
    ports = [2222];
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

  system.stateVersion = "26.05"; # Did you read the comment?
}
