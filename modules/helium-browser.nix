{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  qt6,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "helium";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "imputnet";
    repo = "helium";
    rev = "v${finalAttrs.version}";
    hash = "sha256-be66jS8RrRDElwJBsovoYR436Wt/A9t47gjyeQ2+rs8=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtwebengine
    qt6.qtwebchannel
  ];

  meta = {
    description = "Private, fast, and honest web browser";
    homepage = "https://github.com/imputnet/helium";
    license = lib.licenses.gpl3Only;
    maintainers = [lib.maintainers.rimv];
    mainProgram = "helium";
    platforms = lib.platforms.linux;
  };
})
