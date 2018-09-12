#!/bin/bash
stty -echo

# Init output
OLD_IFS="$IFS"
IFS=

tput clear

tput civis

# Calculate size

SCREEN_WIDTH=$(tput cols)
SCREEN_HEIGHT=$(($(tput lines) - 1))
WIDTH=$((60 % (SCREEN_WIDTH - 2)))
HEIGHT=$((20 % (SCREEN_HEIGHT - 2)))
LEFT=$(((SCREEN_WIDTH - WIDTH) / 2))
TOP=$(((SCREEN_HEIGHT - HEIGHT) / 2))

