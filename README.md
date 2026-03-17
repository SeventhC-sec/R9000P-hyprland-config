# R9000P Hyprland 完整配置

> ✨ 基于 Jakoolit 风格深度定制 | 为联想拯救者 R9000P 优化 | 开箱即用的极致桌面体验

## 🎯 适用机型
✅ **完美适配**：
- 联想拯救者 R9000P 2023
- 联想拯救者 R9000P 2024
- 联想拯救者 R9000P 2025

⚠️ **可兼容但需修改分辨率**：
- 联想拯救者 R9000P 2022
- 联想拯救者 R9000P 2021（需改为 2560x1440@165）

❌ **不适用**：
Y9000P、R7000P、Y7000P、其他品牌电脑、2020 及更早机型

## 🎯 核心特性
- **完整复刻 Jakoolit 视觉**：从状态栏到窗口动画，1:1 还原同款美学
- **R9000P 专属优化**：适配 16:10 高刷屏、独显环境、笔记本电源管理
- **功能齐全**：动态壁纸、自动配色、通知中心、锁屏、休眠、自定义脚本一站式配齐
- **极简依赖**：仅需核心包，无冗余组件，运行流畅
- **安全干净**：不含任何个人隐私、壁纸或系统敏感文件

**一句话：别人装上后，就是和你现在 R9000P 一模一样的桌面环境。**

---

## 🚀 一键部署（Arch Linux）

### 1. 安装必备依赖
```bash
# 核心桌面组件
sudo pacman -S hyprland waybar rofi kitty swaync hyprlock hypridle wallust

# 脚本与工具依赖（截图、剪贴板、权限等）
sudo pacman -S swww python jq cliphist swappy grim slurp wl-clipboard polkit-gnome
 
 
2. 克隆并部署
 
bash
  
cd ~
git clone https://github.com/SeventhC-sec/my-arch-hyprland-config.git
cd my-arch-hyprland-config
chmod +x install.sh
./install.sh
 
 
3. 生效配置
 
- 按  Super + Shift + R  → 重载 Hyprland 配置
- 或按  Super + Shift + E  → 退出后重新登录 Hyprland 会话
 
 
 
🎮 R9000P 专属优化
 
特性 说明 快捷键 
高刷适配 默认 165Hz，自动适配屏幕 自动 
16:10 比例 Waybar、边距完美适配 2560x1600 - 
性能模式 平衡/性能/省电快速切换  Super + Shift + P  
游戏模式 关闭合成器，降低输入延迟  Super + Shift + G  
 
 
 
⚙️ 必要微调（仅 2 步，不影响主体体验）
 
1. 显示器适配
 
- 路径： ~/.config/hypr/UserConfigs/Laptops.conf 
- R9000P 2023/2024/2025 推荐：
 
ini
  
monitor = eDP-1, 2560x1600@165, 0x0, 1
 
 
- R9000P 2021 必须修改为：
 
ini
  
monitor = eDP-1, 2560x1440@165, 0x0, 1
 
 
2. 壁纸与自动配色
 
bash
  
mkdir -p ~/Pictures/wallpapers
# 将壁纸放入目录后执行：
wallust run ~/Pictures/wallpapers/你的壁纸文件名.jpg
 
 
 
 
📁 仓库结构
 
plaintext
  
my-arch-hyprland-config/
├── hypr/          # Hyprland 核心配置（按键、动画、窗口规则等）
├── waybar/        # 状态栏（Catppuccin 主题 + Wallust 动态配色）
├── rofi/          # 应用启动器
├── kitty/         # 终端配置
├── swaync/        # 通知中心
├── install.sh     # 一键部署脚本（自动备份旧配置）
└── README.md      # 说明文档
 
 
 
 
🔄 配置更新
 
bash
  
cd ~/my-arch-hyprland-config
git pull
./install.sh
 
 
 
 
❓ 常见问题
 
Q: 配置不生效怎么办？
 
1. 检查依赖是否全部安装
2. 按  Super + Shift + R  重新加载配置
3. 使用  hyprctl logs  查看错误日志
 
Q: 如何恢复我原来的配置？
A:  install.sh  会自动备份旧配置到  ~/.config/xxx.bak ，
将备份文件夹改回原名即可恢复。
 
 
 
📝 许可证
 
MIT License — 可自由使用、修改、分享。
