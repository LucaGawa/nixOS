{
  programs.git = {
    enable = true;
    userName = "Luca Gawalleck";
    userEmail = "luca.gawalleck@gmail.com";
    # userName = "s6lugawa";
    # userEmail = "s6lugawa@uni-bonn.de";
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
