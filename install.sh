#!/bin/bash
# R9000P Hyprland 一键部署脚本
# 基于 Jakoolit 风格 | Arch Linux 专用

set -e  # 遇到错误立即退出

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== R9000P Hyprland 配置部署 ===${NC}\n"

# 检查是否在正确目录
if [ ! -d "./hypr" ]; then
   echo -e "${RED}错误：未找到 hypr 目录${NC}"
   echo "请确保在仓库根目录运行此脚本"
   exit 1
fi

# 备份旧配置
echo -e "${YELLOW}备份原有配置...${NC}"
BACKUP_DIR="$HOME/.config/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for dir in hypr waybar rofi kitty swaync; do
   if [ -d "$HOME/.config/$dir" ]; then
       mv "$HOME/.config/$dir" "$BACKUP_DIR/"
       echo -e "  ${GREEN}✓${NC} 已备份: $dir"
   fi
done

# 复制新配置
echo -e "\n${YELLOW}部署新配置...${NC}"
for dir in hypr waybar rofi kitty swaync; do
   if [ -d "./$dir" ]; then
       cp -r "./$dir" "$HOME/.config/"
       echo -e "  ${GREEN}✓${NC} 已部署: $dir"
   else
       echo -e "  ${RED}✗${NC} 未找到: $dir"
   fi
done

# 完成提示
echo -e "\n${GREEN}=== 部署完成！===${NC}\n"
echo "后续步骤："
echo "  1. 将壁纸放入 ~/Pictures/wallpapers/"
echo "  2. 运行: wallust run ~/Pictures/wallpapers/你的壁纸.jpg"
echo "  3. 修改显示器配置: ~/.config/hypr/UserConfigs/Laptops.conf"
echo "  4. 重载 Hyprland: Super + Shift + R"
echo -e "\n${YELLOW}享受你的 R9000P 桌面！${NC}"
