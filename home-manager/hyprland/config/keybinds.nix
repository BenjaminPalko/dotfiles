{
  bind =
    [
      "$mainMod, T, exec, $terminal"
      "$mainMod, X, killactive,"
      "$mainMod, ESCAPE, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, F, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, V, togglesplit," # dwindle
      "$mainMod, L, exec, $lockScreen" # hyprlock
      "$mainMod, period, exec, emote"
      "$mainMod, B, exec, firefox"
      "$mainMod CTRL, F, fullscreen"
      ", PRINT, exec, grim -g \"$(slurp)\" - | swappy -f -"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      ###############################################################################
      # Special workspaces
      ###############################################################################
      # Scratchpad
      "CTRL SHIFT, S, togglespecialworkspace, magic"
      "CTRL $mainMod, S, movetoworkspace, special:magic"
      # Terminal
      "CTRL SHIFT, T, togglespecialworkspace, terminal"
      "CTRL $mainMod, T, movetoworkspace, special:terminal"
      # Music
      "CTRL SHIFT, M, togglespecialworkspace, music"
      "CTRL $mainMod, M, movetoworkspace, special:music"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Switch workspaces
      "CTRL ALT, right, workspace, e+1"
      "CTRL ALT, left, workspace, e-1"

      # Audio keybinds
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioStop, exec,"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (
        builtins.genList (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            # Switch workspaces with mainMod + [0-9]
            "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        ) 10
      )
    );
  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
