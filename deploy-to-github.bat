@echo off
chcp 65001 >nul
title 篮球教练计分软件 - GitHub部署向导

echo.
echo ========================================
echo   篮球教练计分软件 - GitHub部署
echo ========================================
echo.

REM 检查Git
git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] Git未安装或未添加到PATH
    echo.
    echo 请尝试：
    echo 1. 重启电脑后再运行此脚本
    echo 2. 或手动打开Git Bash执行命令
    echo.
    pause
    exit /b 1
)

echo [✓] Git已安装
git --version
echo.

REM 进入项目目录
cd /d D:\demo\basketball-coach-app
echo [✓] 当前目录: %CD%
echo.

REM 检查是否已初始化
if exist .git (
    echo [!] Git仓库已存在，跳过初始化
) else (
    echo [*] 初始化Git仓库...
    git init
    echo [✓] Git仓库初始化完成
)
echo.

REM 添加文件
echo [*] 添加文件到暂存区...
git add .
echo.

REM 提交
echo [*] 创建提交...
git commit -m "初始化篮球教练计分软件"
echo [✓] 提交完成
echo.

echo ========================================
echo   下一步操作指引
echo ========================================
echo.
echo 步骤1: 创建GitHub仓库
echo ----------------------------------------
echo 1. 打开浏览器访问: https://github.com/new
echo 2. 登录你的GitHub账号（如无账号请先注册）
echo 3. 填写仓库信息：
echo    - Repository name: basketball-coach-app
echo    - Description: 篮球教练实时计分软件
echo    - 选择 Public
echo    - 不要勾选任何初始化选项
echo 4. 点击 Create repository
echo.
echo 步骤2: 关联远程仓库并推送
echo ----------------------------------------
echo 复制你的GitHub用户名，然后运行以下命令：
echo.
echo    git remote add origin https://github.com/[你的用户名]/basketball-coach-app.git
echo    git push -u origin main
echo.
echo 或者，如果提示输入用户名密码，使用：
echo    git remote add origin https://github.com/[你的用户名]/basketball-coach-app.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 步骤3: 启用GitHub Pages
echo ----------------------------------------
echo 1. 进入仓库页面: https://github.com/[你的用户名]/basketball-coach-app
echo 2. 点击 Settings
echo 3. 左侧菜单点击 Pages
echo 4. Source部分选择：
echo    - Branch: main
echo    - Folder: / (root)
echo 5. 点击 Save
echo 6. 等待1-2分钟后，访问地址为：
echo    https://[你的用户名].github.io/basketball-coach-app/
echo.
echo 步骤4: 生成二维码
echo ----------------------------------------
echo 1. 访问 https://cli.im/ 或 https://www.qr-code-generator.com/
echo 2. 输入你的GitHub Pages地址
echo 3. 生成并下载二维码
echo 4. 将二维码图片发送给教练
echo.
echo ========================================
echo.

REM 询问是否自动推送
set /p push_now="是否已完成GitHub仓库创建？输入 Y 继续推送，或按回车跳过: "
if /i "%push_now%"=="Y" (
    echo.
    set /p username="请输入你的GitHub用户名: "
    if not "!username!"=="" (
        echo.
        echo [*] 添加远程仓库...
        git remote add origin https://github.com/!username!/basketball-coach-app.git
        echo.
        echo [*] 推送到GitHub...
        git push -u origin main
        echo.
        if errorlevel 1 (
            echo [!] 推送失败，可能需要验证身份
            echo 请在Git Bash中手动执行：
            echo    git push -u origin main
        ) else (
            echo [✓] 推送成功！
            echo.
            echo 访问地址: https://!username!.github.io/basketball-coach-app/
            echo.
            echo 接下来：
            echo 1. 在GitHub仓库Settings中启用Pages
            echo 2. 生成二维码分享给教练
        )
    )
)

echo.
pause
