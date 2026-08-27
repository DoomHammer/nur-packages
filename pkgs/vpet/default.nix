{
  source,
  lib,
  buildGoModule,
}:

buildGoModule rec {
  inherit (source) pname version src;

  vendorHash = "sha256-zicQH9sCqkDu2HlqY2Ps7Wh3P7oM4/dP6ZhUI377lwc=";

  meta = with lib; {
    description = "TUI virtual pet with tmux status bar icon";
    homepage = src.meta.homepage;
    maintainers = with maintainers; [ ];
  };
}
