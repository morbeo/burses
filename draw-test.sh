#!/usr/bin/env bash
function d {
  local char=$1
  local number=$2
  local code=$3
  printf "%s\e[${number}${code}" "${char}"
}

# X\e[N
#     a - unknown
#     b - repeat X N times
#     c - ???
#     d - move N lines from top
#     e - move N lines down
#     f - move on line N
#     g - unknown
