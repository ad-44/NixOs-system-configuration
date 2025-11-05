{ pkg, config, lib, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      label = [
      {
        text = "$TIME";
        font_size = 150;
        font_family = "$font";
        position = "0,200";
        halign = "center";
        valign = "center";
        color = "rgb(f9e0aa)";
      }
      ];
    };
      
  };
}
