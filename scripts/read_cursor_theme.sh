
#!/bin/bash

# Set the file path
file_path=~/.config/gtk-4.0/settings.ini

# Check if the file exists
if [ -f "$file_path" ]; then
    # Read the values from the file
    cursor_theme_name=$(awk -F= '/^gtk-cursor-theme-name=/{print $2}' "$file_path" | tr -d '[:space:]')
    cursor_theme_size=$(awk -F= '/^gtk-cursor-theme-size=/{print $2}' "$file_path" | tr -d '[:space:]')

    # Check if values are not empty
    if [ -n "$cursor_theme_name" ] && [ -n "$cursor_theme_size" ]; then
        # Generate the command
        command="hyprctl setcursor '$cursor_theme_name' $cursor_theme_size"
        
        # Execute the command
        eval "$command"
    else
        echo "Error: Unable to read cursor theme name or size from the file."
    fi
else
    echo "Error: File not found - $file_path"
fi

