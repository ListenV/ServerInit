set -e

REPO=https://raw.githubusercontent.com/ListenV/ServerInit/main

wget -P /root/.config/tmux ${REPO}/tmux/tmux.conf
wget -P /root/.config/tmux ${REPO}/tmux/powerline.conf

wget -P /root/.config/nvim ${REPO}/nvim/init.lua
wget -P /root/.config/nvim/lua ${REPO}/nvim/lua/basic.lua
wget -P /root/.config/nvim/lua ${REPO}/nvim/lua/keymap.lua
wget -P /root/.config/nvim/lua ${REPO}/nvim/lua/autocmd.lua
