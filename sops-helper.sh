#!/bin/bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Error: Invalid number of arguments." >&2
  exit 1
fi

COMMAND="$1"
shift

case "$COMMAND" in
encrypt)
  for file in "$@"; do
    if [ ! -f "$file" ]; then
      echo "Error: File not found at '$file'. Skipping." >&2
      continue
    fi
    echo "Encrypting '$file' in-place..." >&2
    sops --encrypt --input-type binary --in-place "$file"
    echo "Encryption of '$file' complete." >&2
  done
  ;;

encrypt-yaml)
  for file in "$@"; do
    if [ ! -f "$file" ]; then
      echo "Error: File not found at '$file'. Skipping." >&2
      continue
    fi
    echo "Encrypting '$file' in-place..." >&2
    sops --encrypt --input-type yaml --output-type yaml --in-place "$file"
    echo "Encryption of '$file' complete." >&2
  done
  ;;

decrypt)
  for file in "$@"; do
    if [ ! -f "$file" ]; then
      echo "Error: File not found at '$file'. Skipping." >&2
      continue
    fi
    sops --decrypt --input-type binary "$file"
  done
  ;;

decrypt-inplace)
  for file in "$@"; do
    if [ ! -f "$file" ]; then
      echo "Error: File not found at '$file'. Skipping." >&2
      continue
    fi
    sops --decrypt --input-type binary --in-place "$file"
  done
  ;;

decrypt-inplace-yaml)
  for file in "$@"; do
    if [ ! -f "$file" ]; then
      echo "Error: File not found at '$file'. Skipping." >&2
      continue
    fi
    sops --decrypt --input-type yaml --output-type yaml --in-place "$file"
  done
  ;;

*)
  echo "Error: Unknown command '$COMMAND'." >&2
  exit 1
  ;;
esac
