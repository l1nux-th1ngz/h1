#!/bin/bash

# Find all shell scripts in the current directory
for file in $(find . -maxdepth 1 -type f -name "*.sh"); do
    # Change permissions to 777 for shell scripts
    chmod 777 "$file"
done
