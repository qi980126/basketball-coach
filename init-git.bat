@echo off
cd /d D:\demo\basketball-coach-app
git --version
if errorlevel 1 (
    echo Git not found in PATH
    exit /b 1
)
echo Git found!
git init
git add .
git commit -m "初始化篮球教练计分软件"
echo.
echo Git repository initialized successfully!
echo.
echo Next steps:
echo 1. Create a repository on GitHub named: basketball-coach-app
echo 2. Run: git remote add origin https://github.com/YOUR_USERNAME/basketball-coach-app.git
echo 3. Run: git push -u origin main
pause
