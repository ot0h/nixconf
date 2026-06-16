{pkgs, ...}: {
  # Avahi (mDNS/DNS-SD)
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
}
