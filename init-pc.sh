#!/bin/bash

set -e

# 判断是否是linux 系统
if [[ `uname` != "Linux" ]] ; then
  echo Not Linux system!
  exit 1
fi

# 判断Linux发行版
if [ ! -r "/etc/os-release" ] ; then
  echo 'File `os-release` unexist!'
  exit 2
fi

# 判断用户是否为root
#user = env | grep USER= | cut -d "=" -f 2
if [[ $USER != 'root' ]] ; then
  echo Must be root user!
  exit 3
fi

source /etc/os-release

case $ID in
arch)
  echo Linux distro is Archlinux.
  # 1. 更换镜像源
  echo Change pacman source...
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
  echo -e "# Generated by init.sh\n
Server = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = http://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
" > /etc/pacman.d/mirrorlist

  # 2. 更新系统
  echo update system...
  pacman -Syyu --noconfirm
  # 3. 安装必要软件
  echo install packages...
  pacman -S --noconfirm --need fish yazi btop ranger tmux git chezmoi neovim wget curl
  ;;
debian)
  echo Linux distro is Debian.
  # 更换镜像源
  echo Change Apt source to tsinghua...
  cp /etc/apt/sources.list /etc/apt/sources.list.bak
  echo "# Generated by init.sh\n
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

#deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
" > /etc/apt/sources.list
  # 更新系统
  apt update
  apt upgrade -y
  apt install -y git fish tmux ranger btop neovim wget
  ;;
opensuse-tumbleweed)
  echo Linux distro is openSUSE Tumbleweed.
  # 更换镜像源
  zypper mr -da
  zypper ar -cfg 'http://mirrors.tuna.tsinghua.edu.cn/opensuse/tumbleweed/repo/oss/' tuna-oss
  zypper ar -cfg 'http://mirrors.tuna.tsinghua.edu.cn/opensuse/tumbleweed/repo/non-oss/' tuna-non-oss
  zypper ref
  zypper in -y --no-recommends fish yazi neovim tmux git btop chezmoi wget curl
  # 关闭zypper安装推介
  cp /etc/zypp/zypper.conf /etc/zypp/zypper.conf.bak
  sed -i 's/# installRecommends = yes/installRecommends = no/' /etc/zypp/zypper.conf
  ;;
*)
  echo Unsupport Linux Distro!
  exit 4
  ;;
esac

#### 设置root基础配置文件 ####
USER_HOME=/root
REPO=https://ghfast.top/https://raw.githubusercontent.com/ListenV/ServerInit/main

# neovim config
rm -rf ${USER_HOME}/.config/nvim
wget -P ${USER_HOME}/.config/nvim ${REPO}/nvim/init.lua
wget -P ${USER_HOME}/.config/nvim/lua ${REPO}/nvim/lua/option.lua
wget -P ${USER_HOME}/.config/nvim/lua ${REPO}/nvim/lua/keymap.lua
wget -P ${USER_HOME}/.config/nvim/lua ${REPO}/nvim/lua/autocmd.lua

# tmux
rm -rf ${USER_HOME}/.config/tmux
wget -P ${USER_HOME}/.config/tmux ${REPO}/tmux/tmux.conf
wget -P ${USER_HOME}/.config/tmux ${REPO}/tmux/powerline.conf

# shell alias
mkdir -p ${USER_HOME}/.config/fish/conf.d
wget -O ${USER_HOME}/.config/fish/conf.d/alias.fish ${REPO}/shell/alias.sh
(curl -fsSL ${REPO}/shell/alias.sh) >> ${USER_HOME}/.bashrc

# yazi
