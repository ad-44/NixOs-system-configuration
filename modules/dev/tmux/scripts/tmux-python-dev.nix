{ pkgs }:

pkgs.writeShellScriptBin "tmux-python-dev" ''
  SESSION="py_$(basename "$PWD" | tr . _)"

  if ! tmux has-session -t $SESSION 2>/dev/null; then
    tmux new-session -d -s $SESSION -n main

    #Top pane: Editor
    tmux send-keys -t $SESSION:main "hx ." C-m
    tmux select-pane -t $SESSION:main.1 -T 'Editor'
    tmux set-option -p -t $SESSION:main.1 @role Editor
    
    #Bottom pane: REPL
    tmux split-window -v -p 15 -t $SESSION:main
    tmux send-keys -t $SESSION:main.2 "jupyter-console" C-m
    tmux select-pane -t $SESSION:main.2 -T 'REPL'
    tmux set-option -p -t $SESSION:main.2 @role REPL
    
    #Focus back to editor
    tmux select-pane -t $SESSION:main.1
  fi

  tmux attach -t $SESSION
''
