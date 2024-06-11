{
  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "image/vnd.djvu+multipage" = ["org.gnome.Evince.desktop"];
      "image/jpeg" = ["org.nomacs.ImageLounge.desktop;"];
      "image/png" = ["org.nomacs.ImageLounge.desktop;"];
    };
    defaultApplications = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "text/html" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/about" = ["firefox.desktop"];
      "x-scheme-handler/unknown" = ["firefox.desktop"];
      "image/jpeg" = ["org.nomacs.ImageLounge.desktop"];
      "image/png" = ["org.nomacs.ImageLounge.desktop"];
    };
  };
}
