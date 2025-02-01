
# keybindings
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+w -Function BackwardKillWord

# Autopredict 
# Set-PSReadLineOption -Colors @{emphasis="#FF0000"; InLinePrediction="Blue"}
Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[38;5;238m" }

# tab complete style
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# update path:
$env:Path += ';$HOME\Appdata\Local\programs\Python\python312\;'
$env:Path += ';C:\msys64\mingw64\lib\python3.10\site-packages'
$env:Path += ';$HOME\Appdata\Local\FlowLauncher\;'

$env:Path += ';C:\msys64\usr\bin'
$env:Path += ';C:\msys64\usr\local\bin'
$env:Path += ';C:\msys64\bin'
$env:Path += ';C:\msys64\opt\bin'
$env:Path += ';C:\msys64\mingw64\bin'

# Aliases
New-Alias s "C:\Program Files\Sublime Text 3\subl.exe"
New-ALias which where.exe
New-Alias xxd format-hex
New-Alias f explorer.exe
