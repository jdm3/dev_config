@echo off

winmergeu "%userprofile%\.gitconfig"     "%~dp0git\.gitconfig"
winmergeu "%userprofile%\.gitignore"     "%~dp0git\.gitignore"

winmergeu "%LocalAppData%\nvim\init.lua" "%~dp0neovim\init.lua"

for /f %%a in ('dir /s /b /ad "%userprofile%\AppData\Local\Packages\Microsoft.WindowsTerminal*"') do (
    winmergeu "%%a\LocalState\settings.json" "%~dp0WindowsTerminal\settings.json"
)
