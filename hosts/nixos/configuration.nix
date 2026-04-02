{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Hardware
    ../../modules/hardware/battery/tlp.nix

    # Servicios del sistema
    ../../modules/servicios/red/samba.nix
    ../../modules/servicios/red/avahi.nix
    ../../modules/servicios/printing/cups.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
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

    allowedTCPPorts = [22 80 2222 1865 3289];
  };

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

  services.libinput.enable = true;
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
  services.desktopManager.gnome.enable = false;

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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  services.printing = {
    enable = true;

    drivers = with pkgs; [
      epson-escpr
      epson-escpr2
    ];

    browsing = true;
    defaultShared = true;
  };

  services.avahi = {
    enable = true;

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

  # Power
  powerManagement.powertop.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 90; # 80 and above it stops charging
    };
  };

  # Audio
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
    extraGroups = ["networkmanager" "wheel" "scanner" "lp"];
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "rrimv";
      user.email = "rimv715@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.firefox.enable = true;

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

  system.stateVersion = "25.11"; # Did you read the comment?
}
