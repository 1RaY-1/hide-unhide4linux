#!/bin/bash
set -e 
target1=hide
target2=unhide

echo "Going to remove $target1 and $target2 ..."
sleep 2s

if [[ $EUID -ne 0 ]]; then
    echo "You have to enter sudo password.."
fi

if which $target1 > /dev/null; then
    target1=$(which hide)
    sudo rm -v $target1
else
    echo "$target1 doesn't exist"
fi

if which $target2 > /dev/null; then
    target2=$(which unhide)
    sudo rm -v $target2
else
    echo "$target2 doesn't exist"
fi

echo -e "Done\n"
