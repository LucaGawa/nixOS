{
  pkgs,
  inputs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    inputs.xremap-flake.packages.${system}.default
  ];
}
