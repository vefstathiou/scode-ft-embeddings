#!/bin/sh
#
# Fetch the repos from the specified file
#

REPODIR=${REPODIR:='/home/repos/github'}

grep -v -e '^$' -v -e '^#' $1 |
while read d ; do
  if [ -d $REPODIR/$d ] ; then
    echo Skipping $d
    continue
  fi
  echo Fetching $d
  GIT_TERMINAL_PROMPT=0 git clone --bare https://github.com/$d.git $REPODIR/$d &&
  chmod -R go+wX $REPODIR/$d
done
