#!/bin/sh
mkdir -p ~/.config/python ~/.config/pipewire/pipewire.conf.d/
cp pythonrc ~/.config/python
cp 99-input-denoising.conf ~/.config/pipewire/pipewire.conf.d/

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si || exit 1
cd ..

sudo sed -i '/BottomUp/s/^#//g ; /\[bin\]/s/^#//g ; /Sudo = doas/s/^#//g' /etc/paru.conf

paru -S geckodriver pavucontrol grim slurp geany telegram-desktop signal-desktop acpid zathura zathura-pdf-mupdf libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent libva-vdpau-driver libvdpau-va-gl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 wget gst-plugin-pipewire gstreamer-vaapi lazygit mesa-utils p7zip mpv yt-dlp linux-tools devtools rsync ethtool tlp thermald smartmontools tlp-rdw powertop udisks2 bc librewolf-bin jellyfin-media-player swayidle wlsunset profile-sync-daemon-librewolf tlpui github-cli thunderbird gamemode keepassxc mosh gnome-disk-utility wdisplays go clang prettyping plzip atool bleachbit lynx odt2txt mediainfo bat bleachbit tealdeer chayang waylock noto-fonts-emoji unicode-emoji mpd pipewire-alsa pipewire-pulse firefox cmake ninja libreoffice-fresh-it hunspell-it hyphen-it mythes-it tnftp pacman-contrib neovim-lspconfig pyright ccls pocl vim-airline cp-p deno typescript-language-server arch-audit bash-language-server gst-plugin-va inetutils mtools dosfstools rust-analyzer noise-suppression-for-voice ttf-liberation adobe-source-sans-fonts ttf-liberation peerflix fzf base91 mullvad-browser-bin --noconfirm --needed || exit 1

xdg-mime default mullvad-browser.desktop x-scheme-handler/https x-scheme-handler/http text/html image/svg
xdg-mime default nemo.desktop inode/directory
xdg-mime default imv.desktop image/jpeg image/png
xdg-mime default org.pwmt.zathura.desktop application/pdf

sudo chmod go-r /boot /etc/nftables.conf /etc/iptables

sudo sed -i 's/Logo=1/Logo=0/g' /etc/libreoffice/sofficerc
sudo sed -i 's/COMPRESSLZ=(lzip -c -f)/COMPRESSLZ=(plzip -c -f)/g' /etc/makepkg.conf

sudo systemctl restart --user pipewire.service
sudo systemctl enable --now thermald tlp acpid
sudo systemctl enable -now paccache.timer
sudo systemctl disable --now NetworkManager-dispatcher.service NetworkManager-wait-online.service
systemctl --user enable --now psd.service

rm -rf ~/.bash* paru
