# Embudo general - importa módulos según el host
{ lib, ... }: {
  # Obtener el hostname del sistema NixOS
  imports = [
    ./hosts/${config.networking.hostName}/default.nix
  ];
}