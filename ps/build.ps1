function Invoke-Latest () {
    .\ps\Invoke-Wraith.ps1  latest configs/history.yaml
}

function Invoke-History () {

    .\ps\Invoke-Wraith.ps1  history configs/history.yaml
}

Clear-Host

$taskName = $args[0].ToString().Replace("-task ","")
$start = Get-Date
Write-Host "Task Name: $($taskName)"
switch ($taskName) {
    build {
        Invoke-Latest
    }
    latest{
        Invoke-Latest
    }
    history {
        Invoke-History
    }
    both {
        Remove-Item -Path "shots_base" -Recurse
        Invoke-History
        Invoke-Latest
    }
    Default {
    }
}

Write-Host "Capture complete" -ForegroundColor Green

$end = Get-Date
Write-Host "Time elapsed" -ForegroundColor Yellow
($end - $start)