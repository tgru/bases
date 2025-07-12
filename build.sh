#!/bin/bash

set -e

INPUT_FILE="round.scad"
HEIGHT_SMALL=3.5
HEIGHT_TALL=4
THICKNESS="1"
DEPTH="2.5"

parameters=(
    "25 23 ${HEIGHT_SMALL}"
    "28 26 ${HEIGHT_SMALL}"
    "32 29 ${HEIGHT_TALL}"
    "40 37 ${HEIGHT_TALL}"
    "50 47 ${HEIGHT_TALL}"
    "60 57 ${HEIGHT_TALL}"
    "70 67 ${HEIGHT_TALL}"
    "80 77 ${HEIGHT_TALL}"
    "90 87 ${HEIGHT_TALL}"
    "100 97 ${HEIGHT_TALL}"
    "130 127 ${HEIGHT_TALL}"
    "160 157 ${HEIGHT_TALL}"
)
echo $(openscad --version) | tr -d '\n'

for row in "${parameters[@]}"; do
    read -r bottom top height<<< "$row"
    
    file_name="round_${bottom}x${bottom}.stl"
    echo "Generating ${file_name}..."

    openscad \
        -q ${INPUT_FILE} \
        -D bottom=${bottom} \
        -D top=${top} \
        -D height=${height} \
        -D depth=${DEPTH} \
        -D thickness=${THICKNESS} \
        --export-format stl \
        -o round_${bottom}x${bottom}.stl
done
echo "Done"