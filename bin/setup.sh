#!/bin/bash

kernel_version=$(uname -r)
if echo "$kernel_version" | grep -q WSL2; then
    echo "Setup for WSL2"
    bash "$PWD/bin/setup_wsl.sh"
else
    echo "Unsupport"
    exit 1
fi
