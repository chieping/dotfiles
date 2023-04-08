#!/bin/bash

print_and_copy() {
  tee >(copy)
  echo
}

copy() {
  if type xclip >/dev/null 2>&1; then
    xclip -selection clipboard
  elif type pbcopy >/dev/null 2>&1; then
    pbcopy
  fi
}
