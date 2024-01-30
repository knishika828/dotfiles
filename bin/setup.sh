#!/bin/bash

if grep -qi Microsoft /proc/version; then
    echo "Setup for WSL2"
    bash "$PWD/bin/setup_wsl.sh"
else
    echo "Unsupport"
    exit 1
fi
