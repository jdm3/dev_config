@echo off
if not exist "%userprofile%" (
    echo USERPROFILE environment variable not set
    exit /b 1
)

winmergeu "%~dp0git\.gitconfig" "%userprofile%\.gitconfig"
winmergeu "%~dp0git\.gitignore" "%userprofile%\.gitignore"
winmergeu "%~dp0vim\.vimrc"     "%userprofile%\.vimrc"
winmergeu "%~dp0vim\.gvimrc"    "%userprofile%\.gvimrc"
winmergeu "%~dp0vim\.vim"       "%userprofile%\vimfiles"

for /f %%a in ('dir /s /b /ad "%userprofile%\AppData\Local\Packages\Microsoft.WindowsTerminal*"') do (
    winmergeu "%~dp0WindowsTerminal\settings.json" "%%a\LocalState\settings.json"
)
