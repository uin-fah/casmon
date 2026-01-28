#!/bin/bash

echo "=== Update sistem ==="
sudo apt update -y

echo "=== Install Kodi ==="
sudo apt install kodi -y

echo "=== Verifikasi instalasi Kodi ==="
kodi --version

echo "=== Install Samba ==="
sudo apt install samba -y
