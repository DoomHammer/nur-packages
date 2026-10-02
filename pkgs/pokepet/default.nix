{
  source,
  lib,
  openssl,
  pkg-config,
  rustPlatform,
  stdenv,
}:

rustPlatform.buildRustPackage {
  inherit (source)
    pname
    version
    src
    ;

  cargoLock = source.cargoLock."Cargo.lock";

  PKG_CONFIG_PATH = "${openssl.dev}/lib/pkgconfig";

  nativeBuildInputs = lib.optionals stdenv.hostPlatform.isLinux [
    pkg-config
  ];

  buildIpnuts = [
    openssl
  ];

  meta = {
    description = "Pixel-exact animated Pokemon pets that walk around your terminal (Ghostty/kitty graphics + tmux)";
    homepage = "https://github.com/n-parisi/pokepet";
    license = lib.licenses.mit;
  };
}
