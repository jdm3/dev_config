@echo off
net session >nul 2>&1
if not %errorlevel% == 0 (
    echo error: must run as administrator
    exit /b 1
)

winget install -e --id Kitware.CMake
winget install -e --id BurntSushi.ripgrep.MSVC
winget install -e --id sharkdp.fd
winget install -e --id LLVM.LLVM
winget install -e --id Neovim.Neovim

mkdir "%LocalAppData%\nvim"
mkdir "%LocalAppData%\nvim\colors"

curl https://github.com/jdm3/dev_config/blob/main/neovim/init.lua                    -o "%LocalAppData%\nvim\init.lua"
curl https://github.com/jdm3/dev_config/blob/main/neovim/nnvim.cmd                   -o "%ProgramFiles%\Neovim\bin\nnvim.cmd"
curl https://github.com/sonph/onehalf/raw/master/vim/colors/onehalfdark.vim          -o "%LocalAppData%\nvim\colors\onehalfdark.vim"
curl https://github.com/sonph/onehalf/raw/master/vim/colors/onehalflight.vim         -o "%LocalAppData%\nvim\colors\onehalflight.vim"
curl https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim -o "%LocalAppData%\nvim\colors\iceberg.vim"

echo Add to your path:
echo %%ProgramFiles%%\LLVM\bin
echo %%ProgramFiles%%\CMake\bin
pause

echo Download a nerdfont version of your desired font: https://www.nerdfonts.com/font-downloads
echo Install it, and set it as your terminal font.
pause

nvim.exe "+Lazy! sync" +qa
