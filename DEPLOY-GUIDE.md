# 篮球教练计分软件 - 部署分享指南

## 📱 方案：GitHub Pages + 二维码分享

教练员扫码即可在手机/平板上使用，无需安装任何软件。

---

## 第一步：安装Git（如未安装）

### Windows系统：
1. 访问 https://git-scm.com/download/win
2. 下载并安装Git
3. 安装完成后，重启电脑或重新打开命令行

### 验证安装：
```bash
git --version
```

---

## 第二步：创建GitHub账号（如未有）

1. 访问 https://github.com
2. 点击 Sign Up 注册
3. 填写用户名、邮箱、密码
4. 验证邮箱

---

## 第三步：创建GitHub仓库

1. 登录GitHub后，点击右上角 **+** → **New repository**
2. 填写信息：
   - Repository name: `basketball-coach-app`
   - Description: `篮球教练实时计分软件`
   - 选择 **Public**（公开）
   - ✅ 勾选 **Add a README file**
3. 点击 **Create repository**

---

## 第四步：上传代码到GitHub

### 方法A：使用命令行（推荐）

打开命令行，依次执行：

```bash
# 进入项目目录
cd D:\demo\basketball-coach-app

# 初始化git仓库
git init

# 添加所有文件
git add .

# 创建第一次提交
git commit -m "初始化篮球教练计分软件"

# 关联远程仓库（替换YOUR_USERNAME为你的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/basketball-coach-app.git

# 推送到GitHub
git push -u origin main
```

### 方法B：使用GitHub Desktop（图形界面）

1. 下载安装 GitHub Desktop: https://desktop.github.com
2. 打开GitHub Desktop，登录GitHub账号
3. File → Add Local Repository → 选择 `D:\demo\basketball-coach-app`
4. 点击 **Publish repository**
5. Repository name: `basketball-coach-app`
6. ✅ 勾选 **Keep this code private**（取消勾选，保持公开）
7. 点击 **Publish repository**

---

## 第五步：启用GitHub Pages

1. 进入你的GitHub仓库页面
2. 点击 **Settings**（设置）
3. 左侧菜单找到 **Pages**
4. 在 **Source** 部分：
   - Branch: 选择 `main`
   - Folder: 选择 `/ (root)`
5. 点击 **Save**
6. 等待1-2分钟，页面会显示访问地址：
   ```
   https://YOUR_USERNAME.github.io/basketball-coach-app/
   ```

---

## 第六步：生成二维码

### 在线生成二维码：

1. 访问 https://www.qr-code-generator.com/
   或 https://cli.im/ （国内推荐）

2. 输入你的GitHub Pages地址：
   ```
   https://YOUR_USERNAME.github.io/basketball-coach-app/
   ```

3. 点击生成二维码

4. 下载二维码图片，打印或发送给教练

---

## 📋 分享给教练的说明

将以下内容发送给教练：

```
【篮球教练计分软件使用说明】

📱 使用方式：
1. 用手机或平板扫描下方二维码
2. 在浏览器中打开
3. 建议添加到主屏幕，方便下次使用

✨ 主要功能：
- 球员信息管理
- 实时比赛计分
- 专业数据统计
- 比赛计时控制
- 球场投篮分布图
- 一键导出Excel报表

💡 使用建议：
- 比赛前先添加球员信息
- 比赛中点击对应按钮记录数据
- 可随时撤销误操作
- 赛后可导出数据保存

【二维码图片】
```

---

## 🎯 其他分享方式

### 方式1：直接发送文件
- 将 `index-standalone.html` 文件发送给教练
- 教练双击文件，在浏览器中打开即可使用
- ✅ 优点：最简单
- ❌ 缺点：无法手机使用，文件可能被拦截

### 方式2：局域网共享
- 在比赛现场搭建临时WiFi
- 使用Python快速启动本地服务器：
  ```bash
  cd D:\demo\basketball-coach-app
  python -m http.server 8080
  ```
- 教练连接WiFi后访问：`http://你的IP:8080`
- ✅ 优点：无需公网
- ❌ 缺点：需要现场操作

### 方式3：微信小程序（需开发）
- 需要微信小程序开发者账号
- 重新开发适配小程序
- ✅ 优点：微信生态，教练易用
- ❌ 缺点：开发周期长

---

## ❓ 常见问题

**Q: GitHub Pages访问慢怎么办？**
A: 可以考虑使用 Gitee Pages（国内平台，访问快）
   - 访问 https://gitee.com
   - 创建仓库并上传代码
   - 开启Gitee Pages服务

**Q: 能否绑定自定义域名？**
A: 可以。在GitHub Pages设置中添加自定义域名，但需要自己购买域名。

**Q: 手机上使用体验如何？**
A: 当前界面已针对移动端优化，按钮大小适合触摸操作。建议使用平板效果更佳。

**Q: 数据会保存吗？**
A: 数据保存在浏览器本地存储中，刷新页面数据不丢失。但建议每次比赛后导出Excel备份。

---

## 🔧 后续优化建议

1. **PWA支持**：添加manifest.json，支持添加到主屏幕
2. **离线使用**：添加Service Worker，支持离线访问
3. **云端同步**：接入云存储，多设备数据同步
4. **数据统计**：添加历史比赛数据查询和统计图表

---

## 📞 技术支持

如遇问题，请联系开发团队。
