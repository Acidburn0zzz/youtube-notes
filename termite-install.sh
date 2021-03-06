#!/usr/bin/env sh

# Installation Termite - Debian / Ubuntu / Mint 
# -------------------------------------------------

# Web + doc: https://github.com/thestinger/termite/
# Wiki: https://wiki.archlinux.org/index.php/Termite

# Source des infos pour l'installation:
# https://www.reddit.com/r/Ubuntu/comments/33l48w/has_anyone_managed_to_install_termite_on_ubuntu/
# https://github.com/Corwind/termite-install/blob/master/termite-install.sh

git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
sudo apt-get install g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac
sudo apt-get install libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev
sudo apt-get install libxml2-utils gperf
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo desktop-file-install termite.desktop
sudo cp /usr/local/lib/libvte-2.91.a /usr/local/lib/libvte-2.91.la \
/usr/local/lib/libvte-2.91.so /usr/local/lib/libvte-2.91.so.0 \
/usr/local/lib/libvte-2.91.so.0.4000.2 /usr/lib
sudo mkdir -p /lib/terminfo/x; ln -s \
/usr/local/share/terminfo/x/xterm-termite \
/lib/terminfo/x/xterm-termite

sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
