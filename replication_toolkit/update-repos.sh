#!/bin/sh
#
# Pull new additions from specified Git repositories
#

. ./default-branch.sh

REPODIR=${REPODIR:='/home/repos/github'}

grep -v -e '^$' -v -e '^#' $1 |
while read d ; do
  echo $d
  gdir="$REPODIR/$d"
  test -d "$gdir" || continue
  BRANCH=$(default_branch "$gdir")
  # Do a fast forward merge without checking out the files
  GIT_TERMINAL_PROMPT=0 git --git-dir="$gdir" fetch --force --prune --update-head-ok origin $BRANCH:$BRANCH || echo '************************************* Update failed *************************'
done
