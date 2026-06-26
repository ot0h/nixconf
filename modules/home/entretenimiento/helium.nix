{
  appimageTools,
  fetchurl,
  stdenv,
  lib,
}: let
  pname = "helium";
  version = "0.13.6.1";

  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
    hash = "sha256-ZcZo/vFXWrZjuPjIt2MYbsxs4LU7NvpB3I6mrPzAJjE=";
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = let
      contents = appimageTools.extract {inherit pname version src;};
    in ''
      mkdir -p "$out/share/applications"
      cp "${contents}/helium.desktop" "$out/share/applications/"
      cp -r ${contents}/usr/share/* "$out/share"

      substituteInPlace $out/share/applications/helium.desktop \
        --replace-warn 'Exec=AppRun' 'Exec=${pname}' \
        --replace-warn 'Exec=helium-linux' 'Exec=${pname}'
    '';

    meta = with lib; {
      description = "Helium Browser for Linux";
      homepage = "https://github.com/imputnet/helium-linux";
      license = licenses.gpl3Only;
      platforms = ["x86_64-linux"];
    };
  }
