#!/bin/sh
#
# Tokenize all files from the specified repos with the specified suffix
#
# Example: tokenize-lang.sh repos py Python swordsPunctuation_Python.txt

REPOFILE=$1
EXTENSION=$2
LANGUAGE=$3
FILTER=$4

REPODIR=${REPODIR:='/home/repos/github'}

export LC_ALL=C

. ./default-branch.sh

grep -v -e '^$' -v -e '^#' $REPOFILE |
while read repo ; do
  gdir="$REPODIR/$repo"
  # Find default branch
  BRANCH=$(default_branch "$gdir")

  echo Repo: $repo 1>&2
  git --git-dir="$gdir" ls-tree -r --name-only $BRANCH |
  grep ".$EXTENSION\$" |
  while read file ; do
    echo File: $repo:$file 1>&2
    git --git-dir="$gdir" show $BRANCH:"$file" |
    tokenizer -l $LANGUAGE -t c
  done
done |
fgrep -v -x -f $FILTER
