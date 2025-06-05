#!/bin/bash
set -e

FILE="input.txt"

if [[ ! -f "$FILE" ]]; then
  echo "Error: $FILE not found."
  exit 1
fi

# Replace "tag 1" with "tag 2"
sed -i 's/tag 1/tag 2/' "$FILE"

echo "Updated '$FILE': replaced 'tag 1' with 'tag 2'."
