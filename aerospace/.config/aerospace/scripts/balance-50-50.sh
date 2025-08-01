#!/bin/bash

# Force 50-50 split for exactly 2 windows in current workspace
# Get current workspace
WORKSPACE=$(aerospace list-workspaces --focused)

# Count windows in current workspace
WINDOW_COUNT=$(aerospace list-windows --workspace $WORKSPACE | wc -l)

if [ $WINDOW_COUNT -eq 2 ]; then
    # Reset layout first
    aerospace flatten-workspace-tree
    
    # Get window IDs
    WINDOWS=($(aerospace list-windows --workspace $WORKSPACE --format '%{window-id}'))
    
    if [ ${#WINDOWS[@]} -eq 2 ]; then
        # Focus first window and resize to 50%
        aerospace focus --window-id ${WINDOWS[0]}
        # Calculate half screen width (assuming 1920px wide screen)
        aerospace resize width 960
    fi
else
    echo "Need exactly 2 windows for 50-50 split. Found: $WINDOW_COUNT"
fi