{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    thunderbird
    spotify
    mathematica
    starship
    eza #ls replacement
    bat #cat replacement
    zoxide #cd replacement
    neofetch
    zoom-us
    vifm
    texliveFull
    owncloud-client
    inkscape
    zathura
    xournalpp
    fzf
    discord
    vlc
    atuin # replacement for upkey history
  ];
}
