
<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000510

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000510).ps1 
#>

# Run PowerShell as Administrator

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System'
$name = 'MaxSize'
$value = 0x00008000  # 32768 decimal

# Create the key if it does not exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null

# Optional: verify
Get-ItemProperty -Path $path | Select-Object $name
