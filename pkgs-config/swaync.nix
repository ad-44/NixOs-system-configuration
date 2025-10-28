{ pkgs, config, ...}:

{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "bottom";
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
      fit-to-screen = false;
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
        "buttons-grid"
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

        buttons-grid = {
          button-per-row = 2;
          actions = [
            {
              label = "";
              type = "toggle";
              active = true;
              command = "";
              update-command = "";
            }
            {
              label = "󰂯";
              type = "toggle";
              active = true;
              command = "";
              update-command = "";
            }
          ];
        };
      };
            
    };
    # style = ''
    #   /* Global Defaults */
    #   * {
    #     outline: none;
    #     font-family: "JetBrainsMono Nerd Font";
    #     font-size: 18pt;
    #     text-shadow: none;
    #     color: @base01;
    #     background-color: transparent;
    #     border-radius: 2px;
    #   }
      
    #   /* Control Center */
    #   .control-center {
    #     background-color: alpha(@base00, 1);
    #     /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.65); */
    #     box-shadow: none;
    #     padding: 2px;
    #     border-bottom: 9px solid @base01;
    #     }

    #     .notification-row .notification-background {
    #     border-radius: 2px;
    #     margin: 5px 0 15px;
    #   }
      
    #   /* Notifications */
    #   .notification {
    #     background-color: @base00;
    #     border: 1px solid alpha(@base01, 0.05);
    #     border-radius: 2px;
    #     padding: 6px 10px;
    #     margin-bottom: 6px;
    #     min-height: 50px;
    #     box-shadow: none;
    #   }

    #   .notification .summary {
    #     font-size: 1rem;
    #     font-weight: 500;
    #     margin-bottom: 2px;
    #   }

    #   .notification .time {
    #     font-size: 0.75rem;
    #     color: alpha(@base01, 0.6);
    #   }

    #   .notification .body {
    #     font-size: 0.95rem;
    #     color: @base01;
    #   }

    #   .notification-action>button {
    #     padding: 5px 10px;
    #     font-size: 0.9rem;
    #     background-color: @base02;
    #     color: @base01;
    #     border-radius: 2px;
    #     border: none;
    #     margin: 6px 6px 0 0;
    #   }

    #   .notification-action>button:hover {
    #     background-color: @base01;
    #   }

    #   .notification-action>button:hover label {
    #     background-color: @base01;
    #     color: @base00;
    #   }

    #   /* Urgency */
    #   .notification.critical {
    #     background: @base0A;
    #     border-left: 9px solid red;
    #   }

    #   .notification.critical .title,
    #   .notification.critical .body,
    #   .notification.critical .summary {
    #     color: alpha(@base02, 0.9);
    #     font-weight: bold;
    #   }

    #   .notification.low,
    #   .notification.normal {
    #     background-color: alpha(@base00, 0.95);
    #     border-left: 9px solid @base01;
    #   }

    #   /* Image */
    #   .image {
    #     margin-right: 10px;
    #     min-width: 36px;
    #     min-height: 36px;
    #     border: none;
    #   }

    #   /* Close button */
    #   .close-button {
    #     background-color: alpha(gray, 0.8);
    #     border-radius: 8px;
    #   }

    #   .close-button label {
    #     color: aliceblue;
    #   }

    #   .close-button:hover {
    #     background-color: alpha(@base01, 0.8);
    #   }

    #   /* Group header buttons */
    #   .notification-group-collapse-button,
    #   .notification-group-close-all-button {
    #     background-color: gray;
    #     color: @base01;
    #     border-radius: 6px;
    #   }

    #   .notification-group-collapse-button:hover {
    #     background-color: blue;
    #     color: @base02;
    #   }

    #   .notification-group-close-all-button:hover {
    #     background-color: red;
    #     color: @base02;
    #   }

    #   /* Sliders */
    #   scale trough {
    #     margin: 0 1rem;
    #     background-color: gray;
    #     min-height: 8px;
    #     min-width: 70px;

    #     border-radius: 30px;
    #   }

    #   trough highlight {
    #     background: blue;

    #     border-radius: 30px;
    #   }

    #   slider {
    #     border-radius: 30px;
    #     background-color: @base01;
    #   }
      
    #   /* Tooltip */
    #   tooltip {
    #     background-color: gray;
    #     color: @base01;
    #   }
      
    #   /* Button grids */
    #   .widget-buttons-grid {
    #     font-size: 1rem;
    #     padding: 20px 20px 10px;
    #   }

    #   .widget-buttons-grid button {
    #     background: @base02;
    #     color: #fff;
    #     border-radius: 50px;
    #     min-width: 60px;
    #     min-height: 30px;
    #     margin: 0 3px;
    #     padding: 6px;
    #   }

    #   .widget-buttons-grid button:hover {
    #     background: @base01;
    #   }

    #   .widget-buttons-grid button.toggle:checked {
    #     background: blue;
    #   }

    #   .widget-buttons-grid button.toggle:checked label {
    #     background: blue;
    #     color: @base00;
    #   }

    #   .widget-buttons-grid button.toggle:checked:hover {
    #     background: alpha(blue, 0.8);
    #   }
      
    #   /* MPRIS */
    #   .widget-mpris .widget-mpris-player {
    #     padding: 6px;
    #     margin: 6px 10px;
    #     background-color: transparent;
    #     box-shadow: none;
    #     border-radius: 2px;
    #   }

    #   .widget-mpris label,
    #   .widget-mpris-title,
    #   .widget-mpris-subtitle {
    #     color: @base01;
    #   }

    #   .widget-mpris-title {
    #     font-size: 1.2rem;
    #     font-weight: bold;
    #     margin: 0 8px 8px;
    #     text-align: center;
    #   }

    #   .widget-mpris-subtitle {
    #     font-size: 1rem;
    #     text-align: center;
    #   }

    #   .widget-mpris-album-art.art {
    #     border-radius: 999px;
    #     min-width: 128px;
    #     min-height: 128px;
    #     background-size: cover;
    #     background-repeat: no-repeat;
    #     overflow: hidden;
    #     box-shadow: none;
    #     background: red;
    #   }

    #   picture.mpris-background {
    #     opacity: 0;
    #     background: none;
    #     box-shadow: none;
    #     border: none;
    #   }

    #   /* Volume widget */
    #   .widget-volume {
    #     padding: 6px 5px 5px;
    #     font-size: 1.3rem;
    #   }

    #   .widget-volume button {
    #     border: none;
    #   }
      
    #   /* Per app Volume */
    #   .per-app-volume {
    #     padding: 4px 8px 8px;
    #     margin: 0 8px 8px;
    #   }

    #   /* Backlight */
    #   .widget-backlight{
    #           padding: 0 0 3px 16px;
    #           font-size: 1rem;
    #         }
            
    #   /* DND */
    #   .widget-dnd {
    #     font-weight: bold;
    #     padding: 20px 15px 15px;
    #   }

    #   .widget-dnd>switch {
    #     background: @base07;
    #     border: none;
    #     border-radius: 100px;
    #     padding: 3px;
    #   }

    #   .widget-dnd>switch:checked {
    #     background: green;
    #   }

    #   .widget-dnd>switch slider {
    #     background: @base00;
    #     border-radius: 12px;
    #     min-width: 18px;
    #     min-height: 18px;
    #   }
      
    #   /* Title */
    #   .widget-title {
    #     padding: 15px;
    #     font-weight: bold;
    #   }

    #   .widget-title>label {
    #     font-size: 1.5rem;
    #   }

    #   .widget-title>button {
    #     background: red;
    #     border: none;
    #     border-radius: 100px;
    #     padding: 0 6px;
    #     transition: all 0.7s ease;
    #   }

    #   .widget-title>button label {
    #     color: @base02;
    #   }

    #   .widget-title>button:hover {
    #     background: alpha(red, 0.8);
    #     box-shadow: 0 0 10px rgba(0, 0, 0, 0.65);
    #   }
      
    # '';
  };
}
