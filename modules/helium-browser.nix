{
  appimageTools,
  fetchurl,
  lib,
}: let
  pname = "helium";
  version = "0.10.1";

  src = fetchurl {
    url = "https://github.com/imputnet/helium/releases/download/v${version}/Helium-${version}.AppImage";
    # OJO: Este hash tenés que actualizarlo cuando Nix te dé el error
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;

    # Esto es para que aparezca en tu menú de aplicaciones (Rofi, Waybar, etc.)
    extraInstallCommands = ''
      mv $out/bin/${pname}-${version} $out/bin/${pname}
    '';

    meta = {
      description = "Private, fast, and honest web browser";
      homepage = "https://github.com/imputnet/helium";
      license = lib.licenses.gpl3Only;
      maintainers = [lib.maintainers.rimv];
      platforms = ["x86_64-linux"];
      mainProgram = "helium";
    };
  }
