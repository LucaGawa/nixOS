{
  programs.zathura = {
    enable = true;
    options = {
      "window-title-home-tilde" = true;
      "statusbar-home-tilde" = true;
      "synctex" = true;
      "synctex-editor-command" = "nvr --remote-silent +%{line} %{input}";
    };
  };
}
