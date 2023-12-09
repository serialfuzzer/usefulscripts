#!/bin/bash

# Set the destination directory
destination_dir="$HOME/wordlists"

# Check if the destination directory exists, if not, create it
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
    # Clone Seclists repository into the destination directory
    git clone https://github.com/danielmiessler/SecLists.git "$destination_dir"
    
    # Check if the clone was successful
    if [ $? -eq 0 ]; then
        echo "Seclists cloned successfully into $destination_dir"
    else
        echo "Error: Cloning Seclists failed."
    fi
fi



echo 'export SECLISTS_DIR="$HOME/wordlists"' >> ~/.bashrc
echo 'export RAFT_SMALL="$SECLISTS_DIR/Discovery/Web-Content/raft-small-words.txt"' >> ~/.bashrc
echo 'export RAFT_MEDIUM="$SECLISTS_DIR/Discovery/Web-Content/raft-medium-words.txt"' >> ~/.bashrc
echo 'export RAFT_LARGE="$SECLISTS_DIR/Discovery/Web-Content/raft-large-words.txt"' >> ~/.bashrc

source ~/.bashrc