#!/bin/bash

# Source the colors.sh file and capture the exported color variables
colors=$(source <(curl -sSL "https://raw.githubusercontent.com/Novafinity/TerminalStyle/master/colors.sh") && export -p | grep -P '^declare -x \K\w+(?==)')

# Convert the colors into an array
read -r -a color_array <<< "$colors"

# Function to generate a random color code
generate_random_color() {
    local color_count=${#color_array[@]}
    local random_index=$((RANDOM % color_count))
    echo "${color_array[random_index]}"
}

# Function to print a bordered line with larger text
print_bordered_line() {
    local text="$1"
    local text_length=${#text}
    local border_length=70

    local border_line=""
    for i in $(seq 1 "$border_length"); do
        border_line="${border_line}─"
    done

    local padding_length=$(( (border_length - text_length - 2) / 2 ))
    local padding=""
    for i in $(seq 1 "$padding_length"); do
        padding="${padding} "
    done

    local random_color=$(generate_random_color)

    printf "${!random_color}\e[1m┌%s┐${NC}\n" "$border_line"
    printf "${!random_color}\e[1m│${NC}%s${text}${NC}%s  ${!random_color}\e[1m│${NC}\n" "$padding" "$padding"
    printf "${!random_color}\e[1m└%s┘${NC}\n" "$border_line"
}
