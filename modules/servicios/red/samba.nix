{ pkgs, ... }: {
  # Samba
  services.samba = {
    enable = true;
    openFirewall = true;
  };
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}