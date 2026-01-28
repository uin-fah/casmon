#!/bin/bash

echo "=== Cek versi OS ==="
lsb_release -d

echo "=== Update sistem ==="
sudo apt update -y

echo "=== Install Kodi ==="
sudo apt install kodi -y

echo "=== Verifikasi instalasi Kodi ==="
kodi --version

echo "=== Install Samba ==="
sudo apt install samba -y

# Direktori share (sesuaikan username jika perlu)
SHARE_DIR="/home/$USER/Share"

echo "=== Membuat direktori share ==="
mkdir -p "$SHARE_DIR"
chmod 777 "$SHARE_DIR"

echo "=== Backup konfigurasi Samba ==="
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

echo "=== Konfigurasi Samba ==="
sudo tee -a /etc/samba/smb.conf > /dev/null <<EOF

[Share]
path = $SHARE_DIR
browseable = yes
read only = no
guest ok = yes
force user = $USER
EOF

echo "=== Restart service Samba ==="
sudo systemctl restart smbd
sudo systemctl enable smbd

echo "=== Status Samba ==="
systemctl status smbd --no-pager

echo "=========================================="
echo "Instalasi selesai "
echo "Langkah selanjutnya:"
echo "1. Jalankan Kodi dengan perintah: kodi"
echo "2. Aktifkan UPnP/DLNA di Settings → Services"
echo "3. Atur SMB Client ke SMBv1"
echo "4. Tambahkan file Music dan Video secara manual"
echo "=========================================="
