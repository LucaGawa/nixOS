{
  pkgs,
  pkgs-stable,
  ...
}: let
  R-with-my-packages = rWrapper.override {packages = with rPackages; [ggplot2 dplyr xts];};
in {
  environment.systemPackages = with pkgs; [
    Rwrapper
    R
    R-with-my-packages
  ];
}
