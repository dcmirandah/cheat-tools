#!/bin/bash

# Define the base directory
BASE_DIR=~/vsc

# Function to display a menu and get user selection
get_user_selection() {
    local -n dirs=$1
    local prompt=$2

    echo -e "\e[1;34m$prompt\e[0m"
    for i in "${!dirs[@]}"; do
        echo -e "\e[34m$((i+1)). ${dirs[$i]}\e[0m"
    done

    while true; do
        read -p $'\e[1;34mEnter your choice (1-'${#dirs[@]}$'):\e[0m ' choice
        if [[ $choice =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= ${#dirs[@]})); then
            return $((choice-1))
        else
            echo -e "\e[41mInvalid choice. Please try again.\e[0m"
        fi
    done
}

# Get the list of first-level directories
first_level_dirs=($(ls -d $BASE_DIR/*/ | xargs -n1 basename))

# Prompt user to select a first-level directory
get_user_selection first_level_dirs "Select a first-level folder:"
first_level_index=$?
selected_first_level=${first_level_dirs[$first_level_index]}

# Get the list of second-level directories within the selected first-level directory
second_level_items=($(ls -1 $BASE_DIR/$selected_first_level/))

# Prompt user to select a second-level directory
get_user_selection second_level_items "Select a second-level folder:"
second_level_index=$?
selected_second_level=${second_level_items[$second_level_index]}

# Open the selected folder in Visual Studio Code
code "$BASE_DIR/$selected_first_level/$selected_second_level"
