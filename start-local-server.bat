@echo off
chcp 65001 >nul
title 篮球教练计分软件 - 本地分享

echo.
echo ========================================
echo   篮球教练计分软件 - 本地访问服务
echo ========================================
echo.
echo 正在启动本地HTTP服务器...
echo.
echo 启动后，您可以：
echo 1. 在本机浏览器访问下方地址
echo 2. 同一WiFi下的手机/平板访问下方地址
echo 3. 按 Ctrl+C 停止服务
echo.
echo ========================================
echo.

REM 尝试使用Python启动服务器
python --version >nul 2>&1
if not errorlevel 1 (
    echo 使用Python启动服务器...
    echo.
    echo 访问地址:
    for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
        echo    http:%%a:8000
    )
    echo    http://localhost:8000
    echo.
    cd /d D:\demo\basketball-coach-app
    python -m http.server 8000
    goto :end
)

REM 尝试使用Node.js的http-server
npx --version >nul 2>&1
if not errorlevel 1 (
    echo 使用Node.js启动服务器...
    echo.
    echo 访问地址:
    for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
        echo    http:%%a:8000
    )
    echo    http://localhost:8000
    echo.
    cd /d D:\demo\basketball-coach-app
    npx http-server -p 8000
    goto :end
)

REM 如果都没有，使用PowerShell
echo 使用PowerShell启动服务器...
echo.
echo 访问地址:
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    echo    http:%%a:8000
)
echo    http://localhost:8000
echo.
cd /d D:\demo\basketball-coach-app
powershell -Command "$listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8000/'); $listener.Prefixes.Add('http://+:8000/'); $listener.Start(); Write-Host 'Server started. Press Ctrl+C to stop...'; while ($listener.IsListening) { $context = $listener.GetContext(); $response = $context.Response; $filePath = $context.Request.Url.LocalPath; if ($filePath -eq '/') { $filePath = '/index-standalone.html' }; $fullPath = Join-Path (Get-Location) $filePath.Substring(1); if (Test-Path $fullPath -PathType Leaf) { $content = [System.IO.File]::ReadAllBytes($fullPath); $response.ContentLength64 = $content.Length; $response.OutputStream.Write($content, 0, $content.Length) } else { $response.StatusCode = 404 }; $response.Close() }"

:end
pause
