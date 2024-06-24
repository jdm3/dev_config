$null = New-Item -ItemType Directory -Force -Path "$env:LocalAppData\nvim"
$null = New-Item -ItemType Directory -Force -Path "$env:ProgramFiles\neovim\bin"
$null = New-Item -ItemType Directory -Force -Path "$env:UserProfile\Documents\PowerShell"

winmergeu "$env:UserProfile\.gitconfig"     "$PSScriptRoot\git\.gitconfig"
winmergeu "$env:UserProfile\.gitignore"     "$PSScriptRoot\git\.gitignore"

winmergeu "$env:LocalAppData\nvim\init.lua"        "$PSScriptRoot\neovim\init.lua"
winmergeu "$env:ProgramFiles\neovim\bin\nnvim.ps1" "$PSScriptRoot\neovim\nnvim.ps1"

foreach ($Dir in Get-ChildItem -Path "$env:LocalAppData\Packages" -Filter "Microsoft.WindowsTerminal*" -Directory) {
    winmergeu "$Dir\LocalState\settings.json" "$PSScriptRoot\WindowsTerminal\settings.json"
}

winmergeu "$profile" "$PSScriptRoot\WindowsTerminal\Microsoft.PowerShell_profile.ps1"
