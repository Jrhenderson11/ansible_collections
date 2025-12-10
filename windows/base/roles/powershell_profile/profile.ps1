
# keybindings
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+w -Function BackwardKillWord

# Autopredict 
# Set-PSReadLineOption -Colors @{emphasis="#FF0000"; InLinePrediction="Blue"}
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle Inline
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[90m" } # Gray color

# tab complete style
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Last arg
Set-PSReadLineKeyHandler -Chord 'Enter' -ScriptBlock {
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    
    if ($line -match '!\$') {
        $lastCommand = (Get-History -Count 1).CommandLine
        if ($lastCommand) {
            $tokens = [System.Management.Automation.PSParser]::Tokenize($lastCommand, [ref]$null)
            $commandTokens = $tokens | Where-Object { $_.Type -eq 'CommandArgument' -or $_.Type -eq 'String' }
            if ($commandTokens.Count -gt 0) {
                $lastArg = $commandTokens[-1].Content
                $newLine = $line -replace '!\$', $lastArg
                [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert($newLine)
            }
        }
    }
    
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

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
New-Alias gcl git clone
git config --global alias.sta status