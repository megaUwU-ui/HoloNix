{
  lib,
  stdenvNoCC,
  fetchurl,
  makeWrapper,
  jre,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "Xtreme Download Manager";
  version = "7.2.11";

  src = fetchurl {
    url = "https://github.com/subhra74/xdm/releases/download/${finalAttrs.version}/xdman.jar";
    hash = "sha256-gRfyhvneHlf0VRZ22PCrPi6ZBER0S1lffMTLngH1HHw=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  dontUnpack = true;

  buildPhase = ''
    runHook preBuild

    makeWrapper ${jre}/bin/java $out/bin/xdman \
      --add-flags "-jar $src"

    runHook postBuild
  '';

  meta = {
    description = "Powerfull download accelerator and video downloader";
    homepage = "https://github.com/subhra74/xdm";
    license = lib.licenses.gpl2;
    #platforms = jdk.meta.platforms;
    sourceProvenance = [ lib.sourceTypes.binaryBytecode ];
    maintainers = with lib.maintainers; [ subhra74 ];
    mainProgram = "xdman";
  };
})
