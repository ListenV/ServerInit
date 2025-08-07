#! /bin/bash

set -e

#### 设置root基础配置文件 ####
ROOT_HOME=/root
REPO=https://ghfast.top/https://raw.githubusercontent.com/ListenV/ServerInit/main

# neovim config
rm -rf ${ROOT_HOME}/.config/nvim
wget -P ${ROOT_HOME}/.config/nvim ${REPO}/nvim/init.lua
wget -P ${ROOT_HOME}/.config/nvim/lua ${REPO}/nvim/lua/option.lua
wget -P ${ROOT_HOME}/.config/nvim/lua ${REPO}/nvim/lua/keymap.lua
wget -P ${ROOT_HOME}/.config/nvim/lua ${REPO}/nvim/lua/autocmd.lua

# tmux
rm -rf ${ROOT_HOME}/.config/tmux
wget -P ${ROOT_HOME}/.config/tmux ${REPO}/tmux/tmux.conf
wget -P ${ROOT_HOME}/.config/tmux ${REPO}/tmux/powerline.conf

### shell alias
# for fish
mkdir -p ${ROOT_HOME}/.config/fish/conf.d
wget -O ${ROOT_HOME}/.config/fish/conf.d/alias.fish ${REPO}/shell/alias.fish
# for bash
(curl -fsSL ${REPO}/shell/alias.fish) >> ${ROOT_HOME}/.bashrc

# yazi
