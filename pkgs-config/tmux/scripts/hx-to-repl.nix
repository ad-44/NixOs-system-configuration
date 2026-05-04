{ pkgs }:

pkgs.writeShellScriptBin "hx-to-repl" ''
  pane_id=$(tmux list-panes -F '#{pane_id} #{@role}' | awk '$2=="REPL" {print $1}')
  wl-paste | tmux load-buffer -
  tmux paste-buffer -t "$pane_id"
''
