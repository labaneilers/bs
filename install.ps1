if (Get-Command git -ErrorAction SilentlyContinue) {
    $git_path = (Get-Command git) | Split-Path | Split-Path
}

$possible_paths = @($env:BS_DIR, "$($git_path)\cmd")
$non_empty_paths = $possible_paths | where {$_}
$target_dir = $non_empty_paths |    
    where {(Test-Path $_)} |
    select -First 1

if (!($target_dir)) {
    $checkedPaths = $non_empty_paths | foreach {$paths} {$paths += "'$_'`r`n"} {$paths}

    Write-Error @"
Couldn't find BS install path.  Checked: 
$checkedPaths
You can manually set the target install dir by setting an environment variable: `$env:BS_DIR
"@
    return
}

$source = "https://raw.githubusercontent.com/labaneilers/bs/master"
iwr -uri "$source/bs" -outfile "$target_dir\bs.sh"

# Write customized cmd file pointing to git's bash executable
$bash_path = "$git_path\bin\sh.exe"
if (!(Test-Path $bash_path)) {
    Write-Error "Could not find bash executable (tried '$bash_path')"
}

$cmd_path = "$target_dir\bs.cmd"

if (Test-Path $cmd_path) {
    rm -Force $cmd_path
}

Set-Content -Path $cmd_path -Value "@echo off"
Add-Content -Path $cmd_path -Value "SET SCRIPT_DIR=%~dp0"
Add-Content -Path $cmd_path -Value "`"$bash_path`" --login -i -- `"%SCRIPT_DIR%bs.sh`" %*"

"Installed bs at $target_dir\bs.cmd"
