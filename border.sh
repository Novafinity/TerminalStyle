#!/bin/bash

# Download the colors.sh file from the GitHub repository
curl -O https://raw.githubusercontent.com/Novafinity/TerminalStyle/master/colors.sh

# Source the colors.sh file
source colors.sh

# Function to generate a random color code
generate_random_color() {
    local colors=($(grep -oP '(?<=export )\w+' colors.sh))
    local color_count=${#colors[@]}
    local random_index=$((RANDOM % color_count))
    echo "${colors[random_index]}"
}

# Function to print a bordered line with larger text
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

    local random_color=$(generate_random_color)

    printf "${!random_color}\e[1m┌%s┐${NC}\n" "$border_line"
    printf "${!random_color}\e[1m│${NC}%s${text}${NC}%s  ${!random_color}\e[1m│${NC}\n" "$padding" "$padding"
    printf "${!random_color}\e[1m└%s┘${NC}\n" "$border_line"
}
