#!/bin/bash

# Text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
ORANGE='\033[0;91m'
NC='\033[0m' # No Color

# Function to print a bordered line with a random color
print_bordered_line() {
    local text="$1"
    local text_length=${#text}
    local border_length=70

    local border_line=""
    for i in $(seq 1 $border_length); do
        border_line="${border_line}─"
    done

    local padding_length=$(( (border_length - text_length - 2) / 2 ))
    local padding=""
    for i in $(seq 1 $padding_length); do
        padding="${padding} "
    done

    # Select a random color from the specified colors
    local colors=("$RED" "$GREEN" "$YELLOW" "$CYAN" "$ORANGE")
    local random_color="${colors[$RANDOM % ${#colors[@]}]}"

    printf "%b┌%s┐%b\n" "$random_color" "$border_line" "$NC"
    printf "%b│%s%s%s   %b│%b\n" "$random_color" "$padding" "$text" "$padding" "$random_color" "$NC"
    printf "%b└%s┘%b\n" "$random_color" "$border_line" "$NC"
}
