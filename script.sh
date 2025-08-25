#!/bin/bash
# NOI Linux ARM64 工具链一键安装脚本
# 适用于 Ubuntu 20.04 Server ARM64

set -e

echo "[*] 更新系统..."
sudo apt update && sudo apt upgrade -y

echo "[*] 安装基础开发工具和 NOI 工具链..."
sudo apt install -y \
  build-essential \
  gcc g++ gdb \
  fpc \
  geany \
  vim nano git make \
  zip unzip curl wget \
  qemu-user-static \
  libncurses5-dev \
  python3 python3-pip

echo "[*] 安装 NOI 经典配置（vimrc、模板等）..."
mkdir -p ~/noi-config
cd ~/noi-config

# 下载 NOI 经典 vim 配置
curl -o .vimrc https://raw.githubusercontent.com/noi-ph/vim-config/main/.vimrc
curl -o cpp-template.cpp https://raw.githubusercontent.com/noi-ph/templates/main/cpp-template.cpp
curl -o pascal-template.pas https://raw.githubusercontent.com/noi-ph/templates/main/pascal-template.pas

# 复制到用户目录
cp .vimrc ~/.vimrc
cp cpp-template.cpp ~/template.cpp
cp pascal-template.pas ~/template.pas

echo "[*] 配置 Geany 快捷键和编译命令（可选）..."
mkdir -p ~/.config/geany
geany --generate-tags || true

echo "[✅] 安装完成！"
echo "你可以开始用 gcc/g++/fpc 编译 NOI 程序了。"
echo "建议重启一次：sudo reboot"
