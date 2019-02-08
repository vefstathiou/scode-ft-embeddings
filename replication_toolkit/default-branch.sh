#!/bin/sh
#
# Function to return the specified repo's default branch
#

default_branch()
{
  local repo="$1"
  # Update head
  GIT_TERMINAL_PROMPT=0 git --git-dir="$repo" remote set-head origin -a >/dev/null 2>&1

  # Obtain and output branch
  GIT_TERMINAL_PROMPT=0 git --git-dir="$repo" remote show origin 2>&1 |
    sed -n 's/^  HEAD branch: //p'
}
