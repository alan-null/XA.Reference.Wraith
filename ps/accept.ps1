<#

.SYNOPSIS
Helper script for running accepting new patterns

.DESCRIPTION
This script can be used to accept new patterns after it turns out that changes visible in diff gallery are no longer up-to-date.

.PARAMETER pages
List of pages names that should be accepted as new patterns.

.EXAMPLE
.\ps\pattern.ps1 renderings_composites
Set the latest result for 'renderings_composites' page and set it as a new pattern

#>

[CmdletBinding()]
param(
    [Parameter(Position=0)]
    [string[]]$pages
)

Clear-Host

Push-Location $PSScriptRoot

if ($pages) {
    Set-Location ..
    $pages | ForEach-Object {
        $latest = Get-Item "shots/$($_)/MULTI_casperjs_pattern_latest.png"
        $pattern = Get-Item "shots_base/$($_)/MULTI_casperjs_pattern.png"

        Copy-Item $latest.FullName  -Destination "shots_base/$($_)/"

        $pattern.Delete()

        Rename-Item -Path "shots_base/$($_)/MULTI_casperjs_pattern_latest.png" -NewName "MULTI_casperjs_pattern.png"
        Remove-Item -Path "shots/$($_)" -Recurse

    }
    .\ps\Invoke-Wraith.ps1  generate_gallery configs/history.yaml
} else {
    Get-Help $MyInvocation.MyCommand.Path
}
Pop-Location