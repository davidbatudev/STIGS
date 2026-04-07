<#
.SYNOPSIS
    Enabling this setting and then selecting the "Process even if the Group Policy objects have not changed" option ensures that the policies will be reprocessed even if none have been changed.
    This way, any unauthorized changes are forced to match the domain-based group policy settings again.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-0000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator
# Registry path where the setting lives
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'

# Name of the registry value to create or update
$Name = 'NoGPOListChanges'

# Required DWORD value for compliance
$Value = 0

# If the registry key does not exist, create it
if (-not (Test-Path -Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

# Verify the result
Get-ItemProperty -Path $Path | Select-Object $Name
