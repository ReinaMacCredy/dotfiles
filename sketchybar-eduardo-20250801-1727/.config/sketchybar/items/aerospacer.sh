#!/usr/bin/env sh

sketchybar --add event aerospace_workspace_change

# Create workspace dots with minimal styling
workspace_ids=($(aerospace list-workspaces --all))
space_items=()
for sid in "${workspace_ids[@]}"; do
    space_items+=("space.$sid")
done

# Subtle container for numbers
sketchybar --add bracket workspace_dots "${space_items[@]}" \
           --set workspace_dots background.color=0x6024283b \
                               background.corner_radius=15 \
                               background.height=28 \
                               background.padding_left=8 \
                               background.padding_right=8

# Create minimal number indicators
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item "space.$sid" left \
               --subscribe "space.$sid" aerospace_workspace_change \
               --set "space.$sid" \
                     icon="$sid" \
                     icon.font="JetBrainsMono Nerd Font:Bold:16.0" \
                     icon.color=0xffa9b1d6 \
                     icon.padding_left=5 \
                     icon.padding_right=5 \
                     label.drawing=off \
                     background.drawing=off \
                     click_script="aerospace workspace $sid" \
                     script="$CONFIG_DIR/plugins/aerospacer.sh $sid"
done