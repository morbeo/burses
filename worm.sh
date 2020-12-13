#!/usr/bin/env bash
# ─ LIGHT HORIZONTAL
# │ LIGHT VERTICAL
# ╭ LIGHT ARC DOWN AND RIGHT
# ╮ LIGHT ARC DOWN AND LEFT
# ╯ LIGHT ARC UP AND LEFT
# ╰ LIGHT ARC UP AND RIGHT

function init {
  pos=( [x]=0 [y]=0 )
  previous="─"
}

function next_character {
  case ${current} in
    ─) next=;;
    │) next=;;
    ╭) next=;;
    ╮) next=;;
    ╯) next=;;
    ╰) next=;;
    *) :;;
  esac
}