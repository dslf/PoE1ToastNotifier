$clientLogPath = 'C:\Games\Path of exile\logs\Client.txt'  
$defaultSoundFolder = Join-Path $PSScriptRoot "Sound" 
$defaultSystemSoundFallback = $true  

$conditions = @(

    @{ Pattern = 'test123'; SoundFile = "test.wav" },

    @{ Pattern = 'Spawning discoverable Hideout'; SoundFile = "" },
    @{ Pattern = 'Bring life, bring power.'; SoundFile = "penisshrine.wav" },
    @{ Pattern = 'drenched in blood.'; SoundFile = "kavetesshrine.wav" },
    @{ Pattern = 'A Reflecting Mist has manifested nearby'; SoundFile = "reflectedmist.wav" },
    @{ Pattern = 'The Nameless Seer has appeared nearby';  SoundFile = "namelesssir.wav" }
)

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

Get-Content $clientLogPath -Tail 1 -Wait | ForEach-Object {
    foreach ($condition in $conditions) {
        if ($_ -match $condition.Pattern) {
            Play-Sound -filename $condition.SoundFile
            Write-Host $_
            break
        }
    }
}
