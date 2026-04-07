<#
.SYNOPSIS
    Administrator accounts must not be enumerated during elevation.
    Enumeration of administrator accounts when elevating can provide part of the logon information to an unauthorized user.
    This setting configures the system to always require users to type in a username and password to elevate a running application.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000200

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator
$Path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI'
$Name = 'EnumerateAdministrators'
$Value = 0

if (-not (Test-Path -Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Get-ItemProperty -Path $Path | Select-Object $Name
