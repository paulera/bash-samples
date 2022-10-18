#!/bin/bash

# These variables allow using colours in scripts with "echo -e"
# Keep names short for easy of use, but not too generic so
# could conflict in the future.

# TODO: extend with other foreground colours
# TODO: extend with background colours

__cy="\033[1;36m"
__gr="\033[1;32m"
__re="\033[1;31m"
__ye="\033[1;33m"
__bl="\033[1;34m"
__wh="\033[1;37m"
__="\033[0m"

# Helpre to display text with support tobackslash escapes (-e), 
# reseting the colour after. Requires "\n" to break lines.
say() {
    echo -ne $1${__}
}

say "This ${__cy}is a ${__}colorful ${__re}message${__}..."
say "${__ye}capisce?\n(still yellow)\n"
say "bye\n\n"
