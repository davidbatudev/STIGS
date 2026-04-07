<#
.SYNOPSIS
    Limits the number of logon attempts to 3.
    The account lockout feature, when enabled, prevents brute-force password attacks on the system. 
    The higher this value is, the less effective the account lockout feature will be in protecting the local system. 
    The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack, while allowing for honest errors made during a normal user logon.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator
# Account Lockout Policy Configuration

# Define values
$Threshold = 3
$Duration = 15
$Window = 15

# Set account lockout threshold (number of invalid attempts)
net accounts /lockoutthreshold:$Threshold

# Set lockout duration (minutes account stays locked)
net accounts /lockoutduration:$Duration

# Set reset counter window (minutes before attempts reset)
net accounts /lockoutwindow:$Window

# Verify settings
net accounts
