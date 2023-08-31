@echo off
winmergeu "%userprofile%\.gitconfig" "%~dp0..\.gitconfig" 
winmergeu "%userprofile%\.gitignore" "%~dp0..\.gitignore" 
winmergeu "%userprofile%\.vimrc"     "%~dp0..\.vimrc"     
winmergeu "%userprofile%\.gvimrc"    "%~dp0..\.gvimrc"    
for /f %%a in ('dir /s /b /ad "%userprofile%\AppData\Local\Packages\Microsoft.WindowsTerminal*"') do (
    winmergeu "%%a\LocalState\settings.json" "%~dp0..\WindowsTerminalSettings.json"
)
