#!/bin/bash

# Base directory for projects
BASE_DIR=~/vsc

# Function to handle menu display and input validation
get_user_selection() {
    local array_name=$1
    local prompt=$2

    # Map the passed array name to a local array
    eval "local -a dirs=(\"\${$array_name[@]}\")"
    local array_size=${#dirs[@]}

    echo -e "$prompt"
    for i in "${!dirs[@]}"; do
        echo -e "$((i+1)). ${dirs[$i]}"
    done

    while true; do
        read -p "Enter your choice (1-$array_size): " choice
        # Validate that input is a number within the array range
        if [[ $choice =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= array_size)); then
            return $((choice-1))
        fi
        echo -e "Invalid choice."
    done
}

# Fetch primary directory list
first_level_dirs=($(find "$BASE_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;))

get_user_selection "first_level_dirs" "Select a first-level folder:"
selected_first_level=${first_level_dirs[$?]}

# Fetch secondary directory list based on first selection
second_level_items=($(find "$BASE_DIR/$selected_first_level" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;))

get_user_selection "second_level_items" "Select a second-level folder:"
selected_second_level=${second_level_items[$?]}

# Launch VS Code in the target path
code "$BASE_DIR/$selected_first_level/$selected_second_level"
