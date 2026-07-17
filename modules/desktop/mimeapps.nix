{ pkgs, config, ... }:

{
  xdg.mime.enable = true;
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "org.gnome.Nautilus.desktop";
    "application/pdf" = "sioyek.desktop";
  };

  xdg.desktopEntries.anytype = {
    name = "Anytype";
    exec = "${pkgs.anytype}/bin/anytype";
    icon = "anytype";
  };
  
}
