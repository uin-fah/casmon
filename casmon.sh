#!/bin/bash

echo "=== Update sistem ==="
sudo pacman -Syu

echo "=== Install Kodi ==="
sudo pacman -S kodi

echo "=== Verifikasi instalasi Kodi ==="
kodi --version
