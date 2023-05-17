#!/bin/bash

# Check if wget or curl is installed
downloader=""
if command -v wget &> /dev/null; then
    downloader="wget -O"
elif command -v curl &> /dev/null; then
    downloader="curl -o"
else
    echo "Neither curl nor wget is installed. Please install either curl or wget."
    exit 1
fi

# Create a temporary directory and file
temp_dir=$(mktemp -d)
temp_file="$temp_dir/ldc.sh"

# Download the source file
$downloader "$temp_file" "https://raw.githubusercontent.com/siwymilek/ldc-sh/main/ldc.sh"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download the file."
    exit 1
fi

# Make the downloaded file executable
chmod +x "$temp_file"

# Move the file to /usr/local/bin/ and ensure sudo is used only if necessary
install_location="/usr/local/bin/ldc"
if [ ! -w "$(dirname $install_location)" ]; then
    sudo mv "$temp_file" "$install_location"
else
    mv "$temp_file" "$install_location"
fi

echo "lazygit script installed successfully at $install_location"

# Clean up the temporary directory
rm -rf "$temp_dir"

