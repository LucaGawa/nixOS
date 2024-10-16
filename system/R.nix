{
  pkgs,
  pkgs-stable,
  ...
}: let
  R-with-my-packages = pkgs.rWrapper.override {packages = with pkgs.rPackages; [qsimulatR ggplot2];};
in {
  environment.systemPackages = with pkgs; [
    R
    R-with-my-packages
  ];
}
