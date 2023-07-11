#!/bin/bash

# Source the colors.sh file
source <(curl -sSL "https://raw.githubusercontent.com/Novafinity/TerminalStyle/master/colors.sh")

# Function to generate a random color code
generate_random_color() {
    local colors=($(compgen -v | grep -P '^export ' | grep -Po '\$\K\w+'))
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
    local color_code="${!random_color}"

    printf "${color_code}\e[1m┌%s┐${NC}\n" "$border_line"
    printf "${color_code}\e[1m│${NC}%s${text}${NC}%s  ${color_code}\e[1m│${NC}\n" "$padding" "$padding"
    printf "${color_code}\e[1m└%s┘${NC}\n" "$border_line"
}
