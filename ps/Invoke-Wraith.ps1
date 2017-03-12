[CmdletBinding()]
param(
    [Parameter(Position=0)]
    [string]$cmd,
    [Parameter(Position=1)]
    [string]$config
)

Clear-Host

Push-Location $PSScriptRoot
cd..
$cur = (Get-Item .).FullName
$mapping = "$($cur):/wraithy"
docker run -P -v $mapping -w='/wraithy' bbcnews/wraith $cmd $config

Pop-Location