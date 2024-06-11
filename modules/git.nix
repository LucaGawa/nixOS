{
  programs.git = {
    enable = true;
    userName = "Luca Gawalleck";
    userEmail = "luca.gawalleck@gmail.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit -m";
    };
    extraConfig = {
      pull = {
        ff = "only";
      };
    };
  };
}
