{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];
  services.xremap = {
    # withHypr = true;
    withWlroots = true;
    config = {
      modmap = [
        {
          name = "Global";
          remap = {
            "CapsLock" = {
              held = "leftctrl";
              alone = "Esc";
              alone_timeout_millis = 500;
            };
            KEY_APPSELECT = "Esc";
          };
        }
      ];
    };
  };
}
