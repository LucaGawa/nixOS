#!/bin/bash

# Terminate Waybar if it's running
pkill waybar

# Wait for a short moment
sleep 0.5

# Start Waybar
waybar
waybar -c ~/.config/waybar/config_bottom
