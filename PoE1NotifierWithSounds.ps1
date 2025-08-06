$clientLogPath = 'C:\Games\Path of exile\logs\Client.txt' 
$defaultSoundFolder = Join-Path $PSScriptRoot "Sound" 
$defaultSystemSoundFallback = $true

if (-not (Test-Path -LiteralPath $clientLogPath -PathType Leaf)) {
    Write-Error "File not found: $clientLogPath`nPlease specify the correct file path in the script."
    exit 1
}
Write-Host "Monitoring: $clientLogPath" -ForegroundColor Green

$conditions = @{
    'test123' = 'test.wav';
    'Spawning discoverable Hideout' = 'hideout.wav';
    'Bring life, bring power.' = 'penisshrine.wav';
    'drenched in blood.' = 'kavetesshrine.wav';
    'A Reflecting Mist has manifested nearby' = 'reflectedmist.wav';
    'The Nameless Seer has appeared nearby' = 'namelesssir.wav';
}

function Play-Sound {
    param (
        [string] $filename
    )

    $fullPath = if ($filename) { Join-Path -Path $defaultSoundFolder -ChildPath $filename } else { "" }

    if ($fullPath -and (Test-Path $fullPath)) {
        Add-Type -AssemblyName presentationcore
        $player = New-Object System.Media.SoundPlayer $fullPath
        $player.Play()
    } elseif ($defaultSystemSoundFallback) {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Media.SystemSounds]::Exclamation.Play()
    }
}

Get-Content $clientLogPath -Tail 1 -Wait |
ForEach-Object {
    foreach ($pattern in $conditions.Keys) {
        if ($_ -match $pattern) {
            Write-Host $_ -ForegroundColor Yellow
            Play-Sound -fileName $conditions[$pattern]
            return
        }
    }
}
