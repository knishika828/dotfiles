#!/bin/bash

if grep -qi Microsoft /proc/version; then
  echo "Setup for WSL2"
  bash "$PWD/bin/setup_wsl.sh"
elif grep -qi Ubuntu /proc/version; then
  echo "Setup for Ubuntu"
  bash "$PWD/bin/setup_ubuntu.sh"
elif grep -qi Arch /proc/version; then
  echo "Setup for ArchLinux"
  bash "$PWD/bin/setup_archlinux.sh"
else
  echo "Unsupport"
fi
