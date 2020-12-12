#!/usr/bin/env bash
# shellcheck disable=SC2034

function repeat {
  local iterations=$1
  if [[ ${iterations} -lt 1 ]]; then
    iterations=1
  fi
  shift
  for i in $(seq 1 ${iterations}); do
    "$@"
  done
}

function disable_echo {
  stty -echo
}

function enable_echo {
  stty echo
}

function draw::code {
  local code="$*"
  printf '\e[%s' "${code}"
}

function draw::gohome {
  draw::code H
}

function draw::goto {
  local X=$1
  local Y=$2
  draw::code "${Y};${X}H"
}

function draw::save_position {
  draw::code s
}

function draw::restore_position {
  draw::code u
}

function draw::move_up {
  local offset=$1
  draw::code "${offset}A"
}

function draw::move_down {
  local offset=$1
  draw::code "${offset}B"
}

function draw::move_right {
  local offset=$1
  draw::code "${offset}C"
}

function draw::move_left {
  local offset="$1"
  draw::code "${offset}D"
}

function draw::nchars {
  local count="$1"
  local char="${2:0:1}"
  printf "%.0s${char}" "$(seq 1 $((count)))"
}

function draw::line {
  local pattern="${1:-─}"
  local length="${2:-${COLUMNS}}"
  printf "%.0s${pattern}" "$(eval echo $(seq 1 $((length))))"
}

function draw::vline {
  local pattern=${1:-│}
  local length=$((${2:${LINES}}))
  printf "%.0s${pattern}" "$(eval echo $(seq 1 $((length))))"
}


#
#       margin-top
#   ┌───border-top──┐
#   │   padding-top │
#   │   content     │
#   │   padding-bot │
#   └───border-bot──┘
#       margin-bot
#
#   BORDER_ULC---BORDER_TOP---BORDER_URC
#       |                         |
#   BORDER_LEFT               BORDER_RIGHT
#       |                         |
#   BORDER_BLC---BORDER_BOT---BORDER_BRC
#
# draw_top     [x] [y] [character]
# draw_left    [x] [y] [character]
# draw_right   [x] [y] [character]
# draw_bottom  [x] [y] [character]
# draw_corners [w:h] [x] [y] [characters]

#	The parameters taken are
# 1. win: the window on which to operate
# 2. ls: character to be used for the left side of the window
# 3. rs: character to be used for the right side of the window
# 4. ts: character to be used for the top side of the window
# 5. bs: character to be used for the bottom side of the window
# 6. tl: character to be used for the top left corner of the window
# 7. tr: character to be used for the top right corner of the window
# 8. bl: character to be used for the bottom left corner of the window
# 9. br: character to be used for the bottom right corner of the window