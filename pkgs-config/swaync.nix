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
        "title#Notifications"
        "notifications"
        "title#quick-settings"
        "dnd"
        "mpris"
        "volume"
        "backlight"
        "menubar#label"
      ];
      widget-config = {
        
       "title#Notifications" = {
          text = "  Notifications";
          clear-all-button = true;
          button-text = "󰆴";
        };

        "title#quick-settings" = {
          text = "  Quick Settings";
          clear-all-button = false;
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
          device = "amdgpu_bl1";
        };

        mpris = {
          autohide = false;
          show-album-art = "always";
          loop-carousel = true;
        };
        
        "menubar#label" = {
          "menu#power-buttons" = {
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
              command = "hyprlock";
             } 
            ];
          };
          "buttons#network-button" = {
            position = "left";
            actions = [
             {
              label = " ";
              command = "swaync-client -t -sw;iwgtk";
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

      trough {
        border: none;
        background: none;
      }

      
      /* -----------------------------------
         🔔 Notifications
      -------------------------------------- */
      .notification {
        background-color: transparent;
        border: 1px solid transparent;
        border-radius: 5px;
        padding: 6px 10px;
        margin-bottom: 6px;
        min-height: 50px;
        box-shadow: none;
      }

      .notification-content {
        background: transparent;
        border: none;
      }

      .notification .summary {
        font-size: 1rem;
        font-weight: 500;
        margin-bottom: 2px;
      }

      .notification .time {
        font-size: 0.75rem;
        color: alpha(@base0D, 0.6);
      }

      .notification .body {
        font-size: 0.95rem;
        color: @base0D;
      }

      .notification-action>button {
        padding: 5px 10px;
        font-size: 0.9rem;
        background-color: @base01;
        color: @base0D;
        border-radius: 2px;
        border: none;
        margin: 6px 6px 0 0;
      }

      .notification-action>button:hover {
        background-color: @base01;
      }

      .notification-action>button:hover label {
        background-color: @base01;
        color: @base05;
      }

      /* Urgency */
      .notification.critical {
        background: alpha(@base01, 0.95);
        border-left: 9px solid @base0D;
        border-right: 1px solid alpha(@base01, 0.95);
        border-bottom: 1px solid alpha(@base01, 0.95);   
        border-top: 1px solid alpha(@base01, 0.95);
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
        }
        
      .notification.critical .title,
      .notification.critical .body,
      .notification.critical .summary {
        color: alpha(@base05, 0.9);
        font-weight: bold;
      }

      .notification.low,
      .notification.normal {
        background-color: alpha(@base00, 0.95);
        border-left: 9px solid @base0D;
        border-right: 1px solid alpha(@base00, 0.95);
        border-bottom: 1px solid alpha(@base00, 0.95);   
        border-top: 1px solid alpha(@base00, 0.95);
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
      }

      /* -----------------------------------
         🖼️ Image/Icon
      -------------------------------------- */
      .image {
        margin-right: 10px;
        min-width: 36px;
        min-height: 36px;
        border: none;
      }

      /* -----------------------------------
         ❌ Close Buttons
      -------------------------------------- */
      .close-button {
        background-color: alpha(@base05, 0.8);
        border-radius: 8px;
      }

      .close-button label {
        color: @base01;
      }

      .close-button:hover {
        background-color: alpha(@base01, 0.8);
      }
            
      
      .widget-volume,
      .widget-backlight {
        background: transparent;
      }

      .widget-menubar>box>.menu-button-bar>button {
        margin: 2px;
        background: transparent;
      }

      .widget-menubar>box>.menu-button-bar>button>label {
        font-size: 16px;
        background: transparent;
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

      .widget-title>button {
        background: transparent;
        border: 1px solid @base00;
      }

      .widget-title>button>label,
      .widget-title>label {
        font-size: 18px;
      }

      .widget-mpris .widget-mpris-player {
        background: @base00;
        border: 1px solid @base01;
      }

      .widget-mpris .widget-mpris-player>box>button {
        background: @base00;
        border: 1px solid transparent;
      }      

      .widget-mpris .widget-mpris-player>box>button:hover {
        background: @base01;
      }
      
    '';
  };
}
