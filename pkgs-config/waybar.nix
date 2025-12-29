{ pkgs, config, lib, ...}:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainbar = {
        layer = "top";
        exclusive = false;
        start_hidden = true;
        reload_style_on_change = true;
        margin-top = 215;
        modules-center = [
          "custom/applauncher"
          "custom/separator"
          "clock"
          "custom/separator"
          "idle_inhibitor"
          "custom/separator"
          "battery"
          "custom/separator"
          "custom/parameters"
        ];

        "clock"= {
          format = " {:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        "battery"= {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time}";
          tooltip = false;
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "custom/separator" = {
          format = "󰇙";
          tooltip = false;
        };

        "custom/applauncher" = {
          format = "  ";
          on-click = "fuzzel";
          tooltip = false;
        };

        "custom/parameters" = {
          format = "  ";
          on-click = "swaync-client -t";
          tooltip = false;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };
                
      };
    };

    style = ''
      * {
        font-size: 20px;
      }

      window#waybar {
        background: transparent;
      }

      .modules-center {
        background: alpha(@base00,0.6);
        border-radius: 5px;
      }

      @Keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
      
      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: @base05;
        animation: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };

  #Systemd services to open waybar only on overview
  systemd.user.services.overview-waybar = {
    Unit = {
      Description = "Display Waybar only on overview";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
      Requisite = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "waybar-overview" ''
        #!/usr/bin/env
        # Listen for overview events and signal waybar
        niri msg --json event-stream | jq -c --unbuffered 'select(.OverviewOpenedOrClosed != null)' | \
        while read -r event; do
          killall -SIGUSR1 .waybar-wrapped
        done
        ''
      }";
      Restart = "on-failure";
    };
     Install = {
       WantedBy = ["multi-user.target"];
     };
  };
}
