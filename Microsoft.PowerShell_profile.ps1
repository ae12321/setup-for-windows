

function open() {
    explorer;
}

# -- my utility
function pshrc() {
    $path = $env:USERPROFILE
    $path = join-path $path "Documents"
    $path = join-path $path "WindowsPowerShell"
    $path = join-path $path "Microsoft.PowerShell_profile.ps1"
    code $path
}
function touch() {
    if ($args.length -eq 0) {
        echo 'filename not selected'
        return
    }
    foreach ($filename in $args) {
        if (test-path $filename) {
            echo "$filename already exists"
        } else {
            new-item -itemtype file -name $filename
        }
    }
}
function e() { explorer (get-location) }
function sudo() { start powershell.exe -verb runas }
function mydata() { cd "C:\mydata" }
function mydev() {
    $path = $env:USERPROFILE
    $path = join-path $path "Desktop"
    $path = join-path $path "dev"
    cd $path
}
function pwdc() { set-clipboard (get-location) }
function chost() {
    $hostsPath = join-path $env:SystemRoot "System32\drivers\etc\hosts"
    # アクセス拒否の回避がわからない
    # $datetime = (get-date).tostring("yyyyMMdd-hhmmss")
    # copy-item -path $hostsPath -destination ($hostsPath + $datetime) -force
    explorer (split-path $hostsPath -parent)
    start notepad $hostsPath -verb runas
}

# -- git
function glo() { git log --oneline }
function gs() { git status }
function gb() { git branch }
function ga() {
    foreach($path in $args) {
        git add $path
    }
}
function gcom() {
    if ($args.length -eq 1) {
        git commit -m $args[0]
    }
}
function gcan() {
    git add .
    git commit --amend --no-edit
}
function gg() {
    git add .
    # $datestring = (get-date).tostring("yyyy-MM-dd(dddd) HH:mm:ss")
    $datestring = (get-date).tostring("yyyy-MM-dd HH:mm:ss")
    git commit -m "committed by script: $datestring"
}
# git reset ...
# git stash ...
# git remote ... 

# -- my prompt
function prompt {
    $nowdir = Split-Path (Get-Location) -Leaf
    Write-Host($nowDir) -NoNewline -ForegroundColor Magenta
    if (git branch) {
        $branch = (git branch | select-string "^\*").ToString()
        $branch = $branch.trim() -replace "^\* *", ""
        Write-Host(" : ") -NoNewline -ForegroundColor White
        Write-Host($branch) -NoNewline -ForegroundColor Yellow
    }
    return " $ "
}