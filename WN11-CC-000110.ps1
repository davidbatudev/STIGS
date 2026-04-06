
<#
.SYNOPSIS
    This PowerShell script ensures that the printing over HTTP is turned off, preventing potentially sensitive information from being
    sent outside the enterprise and uncontrolled updates to the system.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers'
$Name = 'DisableHTTPPrinting'
$Value = 1

#create the key if it doesnt exist
if (-not (Test-Path -Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

#create or update the dword value
New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

#optional verify
Get-ItemProperty -Path $Path | Select-Object $Name
