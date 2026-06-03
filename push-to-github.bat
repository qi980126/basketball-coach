@echo off
chcp 65001 >nul
title 推送代码到GitHub

echo.
echo ========================================
echo   篮球教练计分软件 - 推送到GitHub
echo ========================================
echo.

cd /d D:\demo\basketball-coach-app

echo [*] 正在推送代码到GitHub...
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo [!] 推送失败
    echo.
    echo 可能的原因：
    echo 1. 网络无法连接GitHub（国内常见问题）
    echo 2. 需要GitHub身份验证
    echo.
    echo 解决方案：
    echo ----------------------------------------
    echo 方案1：使用Gitee（码云）
    echo   访问 https://gitee.com 注册账号
    echo   创建仓库后修改远程地址
    echo.
    echo 方案2：配置代理（如果有VPN）
    echo   git config --global http.proxy http://127.0.0.1:端口
    echo   git config --global https.proxy http://127.0.0.1:端口
    echo.
    echo 方案3：使用SSH方式推送
    echo   需要先在GitHub添加SSH密钥
    echo.
    echo 方案4：本地分享
    echo   运行 start-local-server.bat 启动本地服务器
    echo ----------------------------------------
    echo.
) else (
    echo.
    echo [✓] 推送成功！
    echo.
    echo ========================================
    echo   接下来启用GitHub Pages
    echo ========================================
    echo.
    echo 1. 访问 https://github.com/qi980126/basketball-coach-app/settings/pages
    echo 2. 在 Source 部分：
    echo    - Branch: 选择 main
    echo    - Folder: 选择 / (root)
    echo 3. 点击 Save
    echo 4. 等待1-2分钟后，访问地址：
    echo    https://qi980126.github.io/basketball-coach-app/
    echo.
    echo 5. 生成二维码分享给教练：
    echo    访问 https://cli.im/
    echo    输入上面的地址，生成二维码
    echo.
)

pause
