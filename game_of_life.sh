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

# Declare world
declare -a prevWorld
declare -a world

function draw {
  for (( row = 0; row < HEIGHT; row++ ))
  do
    buf=""
    tput cup $(($TOP + $row)) $LEFT

    for (( column = 0; column < WIDTH; column++ ))
    do
      key=1$row\0$column
      if [ ${world[$key]} == 1 ]
      then
        buf+="+"
      else
        buf+=" "
      fi
    done

    echo $buf
  done
}

