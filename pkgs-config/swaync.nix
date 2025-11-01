{ pkgs, config, ...}:

{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      control-center-width = 400;
      control-center-height = 850;
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 0;
      notification-window-width = 380;
      notification-window-height = 200;
      notification-icon-size = 50;
      notification-body-image-height = 200;
      notification-body-image-width = 200;
      timeout = 8;
      timeout-low = 6;
      timeout-critical = 0;
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      text-empty = "No Notifications";
      script-fail-notify = true;
      notification-visibility = {
        example-name = {
          state = "enabled";
          urgency = "Low";
          "app-name" = "Spotify";
        };
      };
      widgets = [
        "title"
        "notifications"
        "dnd"
        "mpris"
        "volume"
        "backlight"
        "menubar#label"
      ];
      widget-config = {
        
        title = {
          text = "Notifications Center";
          clear-all-button = true;
          button-text = "󰆴";
        };

        dnd = {
          text = "Do Not Disturb";
        };

        volume = {
          label = "󰕾";
          expand-button-label = " ";
          collapse-button-label = " ";
          show-per-app = true;
          show-per-app-icon = true;
          show-per-app-label = true;
        };

        backlight = {
          label = "󰃟";
        };

        mpris = {
          autohide = false;
          show-album-art = "always";
          loop-carousel = true;
        };
        
        "menubar#label" = {
          "menu#power-buttons" ={
            label = "⏻";
            position = "right";
            animation-type = "slide_up";
            actions = [
             {             
              label = "⏻  Shutdown";
              command = "systemctl poweroff";
             }
             {
              label = "  Reboot";
              command = "systemctl reboot";
             }
             {
              label = "󰗽  Logout";
              command = "niri msg action quit";
             }
             {
              label = "  Lock";
              command = "systemctl suspend";
             } 
            ];
          };
          "buttons#network-button" = {
            position = "left";
            actions = [
             {
              label = " ";
              command = "swaync-client -t -sw;nm-connection-editor";
             }
            ];              
          };
          "buttons#bluetooth-button" = {
            position = "left";
            actions = [
              {
                label = "󰂯";
                command = "swaync-client -t -sw;blueman-manager";
              }
            ];
          };
        };
          
      };      
    };
    style = ''
      .widget-volume,
      .widget-backlight {
        background: transparent;
      }

      .widget-menubar>box>.menu-button-bar>button {
        margin: 5px;
        background: transparent;
      }

      .widget-menubar>box>.menu-button-bar>button>label {
        font-size: 16px;
      }

      .widget-menubar>box>.menu-button-bar>button:hover {
        background-color: @base01;
      }

      .network-button>button,
      .bluetooth-button>button {
        margin: 5px;
        background: transparent;
      }

      .network-button>button>label,
      .bluetooth-button>button>label {
        font-size: 16px;
      }

      .network-button>button:hover,
      .bluetooth-button>button:hover {
        background-color: @base01;
      }
    '';
  };
}
