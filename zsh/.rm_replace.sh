#!/bin/zsh
echo "Doing: rm $*"
read "flag?Make sure you know what you are doing! (y/n): "
if [ "${flag}" = "y" ]; then
    rm $*
else
    echo "Not removed!"
    false
fi
