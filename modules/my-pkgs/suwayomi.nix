{
  lib,
  stdenvNoCC,
  fetchurl,
  makeWrapper,
  jre,
  nixosTests,
}:

let
  jdk = jre;
in

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "suwayomi-server";
  version = "2.3.2243";

  src = fetchurl {
    url = "https://github.com/Suwayomi/Suwayomi-Server/releases/download/v${finalAttrs.version}/Suwayomi-Server-v${finalAttrs.version}.jar";
    hash = "sha256-ghFBsy4XDUoC08vf7Vd+2PB70iOD/19BMuu1rkDpjdU=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  dontUnpack = true;

  buildPhase = ''
    runHook preBuild

    makeWrapper ${jdk}/bin/java $out/bin/suwayomi-server \
      --add-flags "-jar $src"

    runHook postBuild
  '';

  passthru.tests = {
    suwayomi-server-with-auth = nixosTests.suwayomi-server.with-auth;
    suwayomi-server-without-auth = nixosTests.suwayomi-server.without-auth;
  };

  meta = {
    description = "Free and open source manga reader server that runs extensions built for Mihon (Tachiyomi)";
    longDescription = ''
      Suwayomi is an independent Mihon (Tachiyomi) compatible software and is not a Fork of Mihon (Tachiyomi).

      Suwayomi-Server is as multi-platform as you can get. Any platform that runs java and/or has a modern browser can run it. This includes Windows, Linux, macOS, chrome OS, etc.
    '';
    homepage = "https://github.com/Suwayomi/Suwayomi-Server";
    downloadPage = "https://github.com/Suwayomi/Suwayomi-Server/releases";
    changelog = "https://github.com/Suwayomi/Suwayomi-Server/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mpl20;
    platforms = jdk.meta.platforms;
    sourceProvenance = [ lib.sourceTypes.binaryBytecode ];
    maintainers = with lib.maintainers; [ HoloNix ];
    mainProgram = "suwayomi";
  };
})
