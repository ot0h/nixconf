
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

nix.settings.experimental-features = ["nix-command" "flakes"];


  networking.networkmanager.enable = true;

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

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

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

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  programs.fish = {
  	enable = true;
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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
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
    btop
    opencode
    rofi
    ghostty
    wget
    pywal16
    ncspot
    neovim
    git
    lazygit
    fzf
    zoxide
    fish
    starship
    atuin
    bun
    bat
    cups
    nodejs
    vscode
    zed-editor
    tinymist
    nixd
    alejandra
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
    sass
    glib
    gtk3
    gtk4
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
  ];

networking.firewall.allowedTCPPorts = [ 2222 ];
  services.openssh = {
  	enable = true;

	settings = {
		PasswordAuthentication = false;
		PermitRootLogin = "no";
	};
  	ports =[2222];
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
