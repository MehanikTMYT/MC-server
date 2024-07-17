#!/bin/bash

# Check if tmux server is running
tmux_output=$(tmux ls 2>&1)

# Compare output
if [[ "$tmux_output" == "no server running on /tmp/tmux-1000/default" ]]; then
  # Start a new session if no server is running
  tmux new-session -t MC-server
else
  # Attach to the existing session if server is running
  tmux attach -t MC-server
fi