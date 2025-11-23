{ pkgs, config, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "org.gnome.Nautilus.desktop";
    "application/pdf" = "sioyek.desktop";
  };
}
