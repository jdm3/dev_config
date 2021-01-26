@echo off
if not exist "%userprofile%" (
    echo USERPROFILE environment variable not set
    exit /b 1
)

robocopy "%userprofile%" git .gitconfig .gitignore /NJH /NJS /NDL
robocopy "%userprofile%" vim .vimrc .gvimrc /NJH /NJS /NDL
robocopy "%userprofile%\vimfiles" vim\.vim *.* /MIR /NJH /NJS /NDL
