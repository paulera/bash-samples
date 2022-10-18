#!/bin/bash

# This script demonstrates how to check if a command is available
# in the system and if an application is installed 

if [ -z $1 ]; then
    echo "Usage: $(basename $0) <command>"
    echo "Check if a command exists in this context and what it is"
    exit 1
fi

if [ -z $(command -v "$1") ]; then
    echo "The command $1 exists"
    echo "It is an $(type -t $1)"
else
    echo "The command $1 is not supported"
fi
