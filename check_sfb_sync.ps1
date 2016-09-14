<# 
.SYNOPSIS
    This script checks the replication state of a Skype for Business server.
.DESCRIPTION
    This script checks the replication state of the local Skype for Business server services.
.NOTES
    File Name  : check_sfb_sync.ps1
    Author     : Christian Stankowic - info@stankowic-development.net
.EXAMPLE
    check_sfb_sync.ps1
    OK: Skype for Business services are synchronized
.LINK
    https://www.github.com/stdevel/check_sfb_sync
#>

#############################################################################################

#get state
$state = (Get-CsManagementStoreReplicationStatus -ReplicaFqdn ((Get-WmiObject win32_computersystem).DNSHostName+"."+(Get-WmiObject win32_computersystem).Domain)).uptodate

#return code based on result
if($state -eq $true) {
    Write-Host "OK: Skype for Business services are synchronized"
    exit 0
} else {
    Write-Host "CRITICAL: Skype for Business services are NOT synchronized"
    exit 2
}