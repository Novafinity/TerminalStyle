#!/bin/bash

# Text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
ORANGE='\033[0;91m'
NC='\033[0m' # No Color

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

    printf "${GREEN}\e[1m┌%s┐${NC}\n" "$border_line"
    printf "${GREEN}\e[1m│${NC}%s%s%s  ${GREEN}\e[1m│${NC}\n" "$padding" "$text" "$padding"
    printf "${GREEN}\e[1m└%s┘${NC}\n" "$border_line"
}
