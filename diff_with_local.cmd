@echo off
if not exist "%userprofile%" (
    echo USERPROFILE environment variable not set
    exit /b 1
)

winmergeu git\.gitconfig "%userprofile%\.gitconfig"
winmergeu git\.gitignore "%userprofile%\.gitignore"
winmergeu vim\.vimrc     "%userprofile%\.vimrc"
winmergeu vim\.gvimrc    "%userprofile%\.gvimrc"
winmergeu vim\.vim       "%userprofile%\vimfiles"
