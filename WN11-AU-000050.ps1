<#
.SYNOPSIS
    This PowerShell script enables the Process Creation audit log. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. 
    Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
    Process creation records events related to the creation of a process and the source.

.NOTES
    Author          : David Batu
    LinkedIn        : linkedin.com/in/davidbatu/
    GitHub          : github.com/davidbatudev
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-0000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

#>
#Run Powershell as Administrator

$Subcategory = "Process Creation"

# Get current audit setting
$current = auditpol /get /subcategory:"$Subcategory"

# Check if success is NOT enabled
if ($current -notmatch "Success\s+Enabled") {

    # Apply the correct setting
    auditpol /set /subcategory:"$Subcategory" /success:enable

    Write-Output "Process Creation auditing enabled."
}
else {
    Write-Output "Already configured correctly."
}
