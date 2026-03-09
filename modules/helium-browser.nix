{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "helium";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "imputnet";
    repo = "helium";
    tag = finalAttrs.version;
    hash = "sha256-be66jS8RrRDElwJBsovoYR436Wt/A9t47gjyeQ2+rs8=";
  };

  meta = {
    description = "Private, fast, and honest web browser";
    homepage = "https://github.com/imputnet/helium";
    license = with lib.licenses; [
      bsd3
      gpl3Only
    ];
    maintainers = with lib.maintainers; [
      rimv
    ];
    mainProgram = "helium";
    platforms = lib.platforms.all;
  };
})
