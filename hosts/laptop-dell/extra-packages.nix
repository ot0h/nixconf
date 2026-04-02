{ pkgs, ... }: {
  # Paquetes específicos de laptop-dell que no encajan en otros módulos
  home.packages = with pkgs; [
    # Transferencia local
    localsend
  ];
}