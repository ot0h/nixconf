{ pkgs, ... }: {
  # Printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      epson-escpr
      epson-escpr2
    ];
    browsing = true;
    defaultShared = true;
  };
}