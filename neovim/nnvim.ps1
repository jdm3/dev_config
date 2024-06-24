if ($args.count -eq 1) {
    $resolved = Resolve-Path $args[0] -ErrorAction SilentlyContinue
    if ($resolved) {
        $resolved = ($resolved).Path
    } else {
        $resolved = Get-Command $args[0] -ErrorAction SilentlyContinue
        if ($resolved) {
            $resolved = ($resolved).Path
        } else {
            $resolved = $args[0]
        }
    }

    $args = @('--', $resolved)
}
elseif ($args.count -gt 1) {
    Write-Host "usage: nnvim.ps1 [file]"
    exit 1
}

wt new-tab nvim.exe --cmd "cd $(Get-Location)" $args

