# check_sfb_sync

``check_sfb_sync`` is a Nagios / Icinga plugin for checking [Microsoft Skype for Business](https://www.skype.com/business/skype-for-business/) service replication.

# Requirements
I successfully tested the plugin on Windows Server 2008 / 2012 R2 machines running Microsoft Skype for Business services.

# Usage
The script checks the replication state of Microsoft Skype for Business services - it needs to be executed on the Windows machine, e.g. using [NSClient++](https://www.nsclient.org/).

## Examples
The following example indicates synchronized Microsoft Skype for Business services:
```
PS >.\check_sfb_sync.ps1
OK: Skype for Business services are synchronized
```

A faulty server:
```
PS >.\check_sfb_sync.ps1
CRITICAL: Skype for Business services are NOT synchronized
```

# Installation
To install the plugin, move the PowerShell script to the ``plugins`` directory of your agent and alter the configuration, e.g. for NSClient++:
```
...
#check_sfb_sync
check_sfb_sync=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe c:\NSCP\plugins\check_sfb_sync.ps1
```

Restart the service and schedule a service check.