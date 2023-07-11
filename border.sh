#!/bin/bash

# Function to generate a random color code
generate_random_color() {
    local colors=("\033[0;31m" "\033[0;32m" "\033[0;33m" "\033[0;36m" "\033[0;91m")
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

    printf "${random_color}\e[1m┌%s┐${NC}\n" "$border_line"
    printf "${random_color}\e[1m│${NC}%s%s%s  ${random_color}\e[1m│${NC}\n" "$padding" "$text" "$padding"
    printf "${random_color}\e[1m└%s┘${NC}\n" "$border_line"
}
