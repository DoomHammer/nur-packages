{
  source,
  lib,
  rustPlatform,
}:

rustPlatform.buildRustPackage {
  inherit (source)
    pname
    version
    src
    ;

  cargoLock = source.cargoLock."Cargo.lock";

  meta = {
    description = "Pixel-exact animated Pokemon pets that walk around your terminal (Ghostty/kitty graphics + tmux)";
    homepage = "https://github.com/n-parisi/pokepet";
    license = lib.licenses.mit;
  };
}
