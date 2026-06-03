@echo off
chcp 65001 >nul
echo ========================================
echo   篮球教练计分软件 - 快速部署脚本
echo ========================================
echo.

REM 检查git是否安装
git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Git，请先安装Git
    echo.
    echo 下载地址: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo [✓] Git已安装
echo.

REM 检查是否已初始化git仓库
if exist .git (
    echo [!] Git仓库已存在
) else (
    echo [*] 初始化Git仓库...
    git init
    echo [✓] Git仓库初始化完成
)

echo.
echo [*] 添加文件到暂存区...
git add .

echo.
echo [*] 创建提交...
git commit -m "更新篮球教练计分软件"

echo.
echo ========================================
echo   下一步操作：
echo ========================================
echo.
echo 1. 在GitHub创建新仓库:
echo    https://github.com/new
echo    仓库名: basketball-coach-app
echo.
echo 2. 运行以下命令（替换YOUR_USERNAME）:
echo.
echo    git remote add origin https://github.com/YOUR_USERNAME/basketball-coach-app.git
echo    git push -u origin main
echo.
echo 3. 在仓库Settings ^> Pages中启用GitHub Pages
echo.
echo 4. 访问地址将是:
echo    https://YOUR_USERNAME.github.io/basketball-coach-app/
echo.
echo 5. 生成二维码分享给教练
echo.
pause
