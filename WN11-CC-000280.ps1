<#
.SYNOPSIS
    This setting controls the ability of users to supply passwords automatically as part of their remote desktop connection.
    Disabling this setting would allow anyone to use the stored credentials in a connection item to connect to the terminal server.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-0000280

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
$Name = 'fPromptForPassword'
$Value = 1

if (-not (Test-Path -Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Get-ItemProperty -Path $Path | Select-Object $Name
