$target_dir = $env:BS_DIR
if (! $env:BS_DIR) {
    $target_dir = "C:\Program Files\Git\cmd"
}
$source = "https://raw.githubusercontent.com/labaneilers/bs/master"

if (!( test-path $target_dir)) {
    "ERROR: Couldn't find default install dir: $target_dir"
    "You can set the target install dir by setting an environment variable: `$env:BS_DIR"
    return 1
}

iwr -uri "$source/bs.cmd" -outfile "$target_dir\bs.cmd"
iwr -uri "$source/bs" -outfile "$target_dir\bs.sh"

"Installed bs at $target_dir\bs.cmd"