<#
.SYNOPSIS
    Disables use of plain text passowrds.
    Basic authentication uses plain text passwords that could be used to compromise a system.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service'
$Name = 'AllowBasic'
$Value = 0

if (-not (Test-Path -Path $Path)) {
   New-Item -Path $Path -Force | Out-Null
   }
New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Get-ItemProperty -Path $Path | Select-Object $Name
