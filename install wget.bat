@echo off
rem 创建目录并下载 wget
set "dest=%~dp0tools\bin\"
mkdir "%dest%" 2>nul
curl -L -o "%dest%wget.exe" "https://eternallybored.org/misc/wget/1.21.4/64/wget.exe"

rem 规范化目录（去掉末尾反斜杠）
set "adddir=%dest%"
if "%adddir:~-1%"=="\" set "adddir=%adddir:~0,-1%"

rem 如果 PATH 中没有则添加到用户 PATH（持久化）
echo %PATH% | find /I "%adddir%" >nul
if errorlevel 1 (
  setx PATH "%PATH%;%adddir%"
  echo Added %adddir% to PATH. Please reopen terminals to apply.
) else (
  echo %adddir% already in PATH.
)
