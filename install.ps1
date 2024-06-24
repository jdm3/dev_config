winget install --exact --id Kitware.CMake
winget install --exact --id BurntSushi.ripgrep.MSVC
winget install --exact --id sharkdp.fd
winget install --exact --id LLVM.LLVM
winget install --exact --id Neovim.Neovim
winget install --exact --id OpenJS.NodeJS
winget install --exact --id Winmerge.WinMerge

$null = New-Item -ItemType Directory -Force -Path "$env:LocalAppData\nvim"
$null = New-Item -ItemType Directory -Force -Path "$env:LocalAppData\nvim\colors"
$null = New-Item -ItemType Directory -Force -Path "$env:LocalAppData\nvim\lsp"

Write-Host "Add to your path:"
Write-Host "    %ProgramFiles%\LLVM\bin"
Write-Host "    %ProgramFiles%\CMake\bin"
Write-Host "Press any key to continue..." -NoNewline
$null = [Console]::ReadKey($true)

Write-Host "Run winmergeu and import settings (Edit -> options -> import) from winmerge/winmerge.ini"
Write-Host "Press any key to continue..." -NoNewline
$null = [Console]::ReadKey($true)

Write-Host "Download a nerdfont version of your desired font: https://www.nerdfonts.com/font-downloads"
Write-Host "Install it, and set it as your terminal font."
Write-Host "Press any key to continue..." -NoNewline
$null = [Console]::ReadKey($true)

Write-Host "Diffing configuration..." -NoNewLine
powershell -Command "Start-Process diff.ps1 -Verb RunAs"
Write-Host "Press any key to continue..." -NoNewline
$null = [Console]::ReadKey($true)

nvim.exe "+Lazy! sync" +qa
