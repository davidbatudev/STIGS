<#
.SYNOPSIS
    This PowerShell script ensures that standard user accounts will not be granted elevated privileges. Elevated privileges when installing applications
    can allow malicious persons and applications to gain full control of a system.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'
$Value = 0
$Name = 'AlwaysInstallElevated'

#create key if it doesnt exist
if (-not (Test-Path -Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

#create or update dword value
New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
