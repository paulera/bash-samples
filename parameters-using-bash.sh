#!/bin/bash

# This script demonstrates how to handle parameter with bash.
# This approach allows long name redundancy (for readability
# purposes).

usage() {
    echo "
Usage: $(basename $0) [-d|--debug [0-3]] [-h|--human] <-o|--output filename> filelist
Display information about a file.

Options:
  --help              Display this usage info
  -d, --debug         Enable debug (default level 1)     - Optional param with optional value
  -o, --output        Output file                        - Mandatory param with mandatory value
  -h, --human         Make info human-readable           - Flag, no value expected
  filelist            Input files separated by space     - Value after all options
"
}


# Variables to store the value read from params
PARAM_DEBUG=0
PARAM_OUTPUT=""
PARAM_HUMAN=0
PARAM_FILELIST=""


# Iterates over the params to process each one.
while (( "$#" )); do  # $# = size of params array. 
                      # decrements on every call to `shift`
 
    ARG="$1" # $1 is the pointer to the current param item (move it forward with `shift`)
    NEXT_ARG="$2"
    HAS_NEXT_ARG="0" && [ ! -z $2 ] && HAS_NEXT_ARG="1" 
    IS_NEXT_ARG_PARAM="0" && [[ $2 = -* ]] && IS_NEXT_ARG_PARAM="1" # check if starts with "-"

    case "$ARG" in

        # --help takes most priority, nothing else should happen
        # when it is present.
        --help)
            usage
            exit 0
            ;;
        
        -h | --human) PARAM_HUMAN="1" ;; # one-liner for simple flags

        -d | --debug)
            PARAM_DEBUG="1" # set default value to 1

            # value is optional
            if [ "$HAS_NEXT_ARG" = "0" ] || [ "$IS_NEXT_ARG_PARAM" = "1" ]; then
                shift
                continue
            fi

            # value must be number
            if ! [[ $NEXT_ARG =~ ^[0-9]+$ ]]; then
                echo "Error: debug level must be a number. \"$NEXT_ARG\" provided."
                usage
                exit 1
            fi

            # check value range
            if (( $NEXT_ARG < 1 )) || (( $NEXT_ARG > 3 )); then
                echo "Error: debug level must be from 1 to 3"
                usage
                exit 1
            fi

            PARAM_DEBUG="$NEXT_ARG"
            shift
            ;;

        -o | --output)
            if [ "$HAS_NEXT_ARG" = "0" ] || [ $IS_NEXT_ARG_PARAM = "1" ]; then
                echo "The argument $ARG expects one output file"
                usage
                exit 1
            fi
            PARAM_OUTPUT=$NEXT_ARG
            shift
            ;;

        -?*)
            echo "Unknow option: $ARG"
            usage
            exit 1
            ;;
        
        *)
            # not matching any of the above, must be the end of filelist
            break;

   esac
   shift # iterates the $1 pointer in the arguments list
done


# gets what's left after the current position of the arguments pointer
# if nothing is provided, read from stdin in case it is coming from a pipe
REST="$*" && [ -z "$REST" ] && REST=$(cat -)


(( $PARAM_DEBUG > 0 )) && echo "[DEBUG] Debug enabled (level = $PARAM_DEBUG)"

(( $PARAM_DEBUG >= 1 )) && echo "[DEBUG] The human readable flag is "$PARAM_HUMAN

if [ -z "$PARAM_OUTPUT" ]; then
    echo "Error: The output file is mandatory argument"
    usage
    exit 1
fi

(( $PARAM_DEBUG >= 1 )) && echo "[DEBUG] output file set as $PARAM_OUTPUT"

if [ -z "$REST" ]; then
    echo "Error: no file list provided"
    usage
    exit 1
else
    echo "File list:"
    for file in $REST; do
        echo "  - $file"
    done
fi

# From here the script can do its magic using the params :)

