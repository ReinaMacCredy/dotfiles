#!/bin/bash

# Fix workspace colors permanently
for i in {1..5}; do
    sketchybar --set workspaces.1.$i label.color=0xffffffff
done