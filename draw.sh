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
  local offset=$1
  draw::code "${offset}D"
}

function draw::nchars {
  local count=$1
  local char=$2
  printf "%${count}s" | sed "s@ @${char}@g"
}

function draw::line {
  local pattern=${1:-─}
  local length=$2
  repeat "${length:-${COLUMNS}}" printf "${pattern:0:1}"
}

function draw::vline {
  local pattern=${1:-│}
  local length=$(($2))
  repeat
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
draw::line

