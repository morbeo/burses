#!/usr/bin/env bash
# ─ LIGHT HORIZONTAL
# │ LIGHT VERTICAL
# ╭ LIGHT ARC DOWN AND RIGHT
# ╮ LIGHT ARC DOWN AND LEFT
# ╯ LIGHT ARC UP AND LEFT
# ╰ LIGHT ARC UP AND RIGHT

function init {
  declare -A pos=( [x]=0 [y]=0 )
  #current="─"
  direction=right
  right=(─ ╮ ╯)
  left=(─ ╭ ╰)
  up=(│ ╮ ╭)
  down=(│ ╯ ╰)
}

function error {
  echo "Error direction ${direction} current ${current}"
  break
}

function next {
  local next
  declare -n next=${!direction}
  echo "${next[$((RANDOM % ${#next[@]}))]}"
}

function move_right {
  direction=right
  if [[ $((pos[x]+1)) -gt ${COLUMNS} ]] ; then
    pos[x]=0
  else
    : $((pos[x]++))
  fi
}

function move_left {
  direction=left
  if [[ $((pos[x]-1)) -lt 0 ]]; then
    pos[x]=${COLUMNS}
  else
    : $((pos[x]--))
  fi
}

function move_up {
  direction=up
  if [[ $((pos[y]-1)) -lt 0 ]]; then
    pos[y]=${LINES}
  else
    : $((pos[y]--))
  fi
}

function move_down {
  direction=down
  if [[ $((pos[y]+1)) -gt ${LINES} ]]; then
    pos[y]=0
  else
    : $((pos[y]++))
  fi
}

function next_character {
  local next=$(next)
  case ${direction}${next} in
    right─) move_right;;
    right╮) move_down;;
    right╯) move_up;;
     left─) move_left;;
     left╭) move_down;;
     left╰) move_up;;
       up│) move_up;;
       up╮) move_left;;
       up╭) move_right;;
     down│) move_down;;
     down╯) move_left;;
     down╰) move_right;;
         *) error;;
  esac
  printf "\e[${pos[y]};${pos[x]}H%s" "${next}"
}