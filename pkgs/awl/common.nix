{
  source,
  flutter,
}:

rec {
  inherit (source.awl) pname version src;
  awl_flutter =
    (flutter.buildFlutterApplication rec {
      inherit (source.awl-flutter) pname version src;

      autoPubspecLock = "${src}/pubspec.lock";

    }).overrideAttrs
      (oldAttrs: {
        outputs = [ "out" ];

        targetFlutterPlatform = "web";

        # flutterFlags = [
        #   "--no-web-resources-cdn"
        #   "--pwa-strategy=none"
        #   "--csp"
        # ];

        # buildPhase = ''
        #   set -x
        #   runHook preBuild
        #
        #   # doPubGet flutter pub get --offline -v
        #   flutter build web -v --release --no-web-resources-cdn --pwa-strategy=none --csp
        #   rm -rf build/web/canvaskit
        #
        #   runHook postBuild
        # '';
        #
        # installPhase = ''
        #   runHook preInstall
        #
        #   mv build/web $out
        #
        #   runHook postInstall
        # '';
      });
  # patches = [ ./router.patch ];
  patches = [ ];
}
