&winget install --exact --id Kitware.CMake
&winget install --exact --id BurntSushi.ripgrep.MSVC
&winget install --exact --id sharkdp.fd
&winget install --exact --id LLVM.LLVM
&winget install --exact --id Neovim.Neovim
&winget install --exact --id OpenJS.NodeJS
&winget install --exact --id WinMerge.WinMerge

Write-Host "Add to your path:"
Write-Host "    %ProgramFiles%\LLVM\bin"
Write-Host "    %HomeDrive%%HomePath%\AppData\Local\Programs\WinMerge"
pause

Write-Host "Run winmergeu and import settings (Edit -> options -> import) from winmerge/winmerge.ini"
pause

Write-Host "Download a nerdfont version of your desired font: https://www.nerdfonts.com/font-downloads"
Write-Host "Install it, and set it as your terminal font."
pause

Write-Host "Diffing configuration..." -NoNewLine
Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutoinPolicy Bypass -File $PSScriptDir\diff.ps1"
pause

&$env:ProgramFiles\neovim\bin\nvim.exe "+Lazy! sync" +qa
