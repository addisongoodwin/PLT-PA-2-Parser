#!/bin/bash

# Define the parser script and input directory
PARSER_SCRIPT="parser.py"
INPUT_DIR="lexer_output"

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
  echo "Input directory '$INPUT_DIR' does not exist. Please create it and add sample input files."
  exit 1
fi

# Find all input files in the directory (assuming they have a .txt extension)
input_files=("$INPUT_DIR"/*.txt)

# Run parser.py on each file 5 times
for file in "${input_files[@]}"; do
  echo "Processing file: $file"
  for ((i = 1; i <= 5; i++)); do
    echo "Run #$i:"
    python3 "$PARSER_SCRIPT" "$file"
    echo "----------"
  done
done
