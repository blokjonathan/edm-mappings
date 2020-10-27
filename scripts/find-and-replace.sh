#!/bin/sh

find . -name 'Item*' -exec sh -c './replace.sh "$1"' -- {} \;
