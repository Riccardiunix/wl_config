#!/bin/sh
mkdir -p ~/.local/share/keepassxc/
rsync -aruPW server@SERVER_IP:~/Syncl/Passwords.kdbx ~/.local/share/keepassxc/
rsync -aruPW server@SERVER_IP:~/Syncl/urls ~/.config/newsboat/
