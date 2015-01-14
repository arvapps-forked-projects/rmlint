#!/bin/sh
# This file was autowritten by rmlint
# rmlint was executed from: %s
# Your command line was: %s

ask() {
    cat << EOF
This script will delete certain files rmlint found.
It is highly advisable to view the script first!

Execute this script with -d to disable this message
Hit enter to continue; CTRL-C to abort immediately
EOF
    read dummy_var
}

echo "\n"

usage() {
    cat << EOF
usage: $0 options

OPTIONS:
-h      Show this message.
-d      Do not ask before running.
-x      Keep rmlint.sh; do note autodelete it.
EOF
}

cp_hardlink() {
    cp -a --link "$1" "$2"
}

cp_symlink() {
    cp -a --symbolic-link "$1" "$2"
}

cp_reflink() {
  cp -a --reflink=always "$1" "$2"
}

DO_REMOVE=
DO_ASK=

while getopts "dhx" OPTION
do
  case $OPTION in
     h)
       usage
       exit 1
       ;;
     d)
       DO_ASK=false
       ;;
     x)
       DO_REMOVE=false
       ;;
  esac
done

if [ -z $DO_ASK ]
then
  usage
  ask
fi

user='%s'
group='%s'

######### START OF AUTOGENERATED OUTPUT #########


