set -e

REPO=https://raw.githubusercontent.com/ListenV/ServerInit/main
USER_HOME=/root

wget -P ${USER_HOME}/.config/tmux ${REPO}/tmux/tmux.conf
wget -P ${USER_HOME}/.config/tmux ${REPO}/tmux/powerline.conf

wget -P ${USER_HOME}/.config/nvim ${REPO}/nvim/init.lua
wget -P ${USER_HOME}/.config/nvim/lua ${REPO}/nvim/lua/basic.lua
wget -P ${USER_HOME}/.config/nvim/lua ${REPO}/nvim/lua/keymap.lua
wget -P ${USER_HOME}/.config/nvim/lua ${REPO}/nvim/lua/autocmd.lua

mkdir -p ${USER_HOME}/.config/fish/conf.d
wget -O ${USER_HOME}/.config/fish/conf.d/alias.fish ${REPO}/shell/alias.sh

(curl -fsSL ${REPO}/shell/alias.sh) >> ${USER_HOME}/.bashrc
