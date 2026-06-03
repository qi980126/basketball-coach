@echo off
chcp 65001 >nul
title 推送到Gitee

echo.
echo ========================================
echo   推送代码到Gitee
echo ========================================
echo.
echo 系统将提示输入用户名和密码：
echo   用户名: 输入你的Gitee用户名
echo   密码: 粘贴刚才创建的私人令牌
echo.
echo ========================================
echo.

cd /d D:\demo\basketball-coach-app
git push -u origin main

if errorlevel 1 (
    echo.
    echo [!] 推送失败
    echo 请检查用户名和令牌是否正确
    pause
) else (
    echo.
    echo [✓] 推送成功！
    echo.
    echo ========================================
    echo   启用Gitee Pages
    echo ========================================
    echo.
    echo 1. 访问 https://gitee.com/qixiaoyu980126/basketball-coach-app/pages
    echo 2. 点击 启动 按钮
    echo 3. 等待部署完成后，访问地址：
    echo    https://qixiaoyu980126.gitee.io/basketball-coach-app/
    echo.
    echo 4. 生成二维码分享给教练：
    echo    访问 https://cli.im/
    echo    输入上面的地址生成二维码
    echo.
    pause
)
