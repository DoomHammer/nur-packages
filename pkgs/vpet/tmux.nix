{
  source,
  callPackage,
  buildTmuxPlugin,
}:
let
  vpet = callPackage ./default.nix { inherit source; };
in
buildTmuxPlugin {
  inherit (source) pname version src;

  postPatch = ''
    sed -i '/^VPET_DIR.*/d' vpet.tmux
    sed -i '/^CURRENT_DIR.*/d' vpet.tmux
    sed -i 's#go run .*main.go#'${vpet}/bin/vpet'#g' vpet.tmux
    sed -i 's/cd .*VPET_DIR} && //' vpet.tmux
  '';

  pluginName = source.pname;
  rtpFilePath = "vpet.tmux";
}
