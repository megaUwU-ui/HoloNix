# https://nix.dev/tutorials/packaging-existing-software
{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "syncyomi";
  version = "1.1.14";

  src = fetchurl {
    url = "https://github.com/syncyomi/syncyomi/releases/download/v${version}/syncyomi_${version}_linux_x86_64.tar.gz";
    hash = "sha256-6309Mq9/Jc8+tj8hZcCyxXKohOPWJbnmqbCry3U8IWE=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D syncyomi $out/bin/syncyomi
    runHook postInstall
  '';

  meta = {
    description = "Open-source project to synchronize Tachiyomi manga reading progress and library across multiple devices";
    homepage = "https://github.com/SyncYomi/SyncYomi";
    license = lib.licenses.gpl2Only;
    mainProgram = "syncyomi";
    platforms = lib.platforms.linux;
  };
}
