#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $(basename $0) <file>"
    echo "Does a breakdown of file path info (folder, filename, extension)"
    exit 1
fi

ABSOLUTE_FILE_PATH=$(readlink -m "$1")
RELATIVE_FILE_PATH="./"$(realpath --relative-to="." "$1")

ABSOLUTE_FOLDER=$(dirname -- "$ABSOLUTE_FILE_PATH")
RELATIVE_FOLDER=$(dirname -- "$RELATIVE_FILE_PATH")

FILE=$(basename -- "$ABSOLUTE_FILE_PATH")
FILENAME="${FILE%.*}"
EXTENSION=""
[[ $FILE =~ \. ]] && EXTENSION=".${FILE##*.}"

echo "Absolute file path: $ABSOLUTE_FILE_PATH"
echo "Absolute folder: $ABSOLUTE_FOLDER"

echo "Relative file path: $RELATIVE_FILE_PATH"
echo "Relative folder: $RELATIVE_FOLDER"

echo "File: $FILE"
echo "File name: $FILENAME"
echo "File extension: $EXTENSION"
