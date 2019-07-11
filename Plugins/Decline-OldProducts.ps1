<#
.SYNOPSIS
Decline Old Windows Versions that come into WSUS
.DESCRIPTION
Decline Old Windows Versions that come into WSUS
.NOTES
N/A
Written By: Bryan Dam
Version 1.0: 10/25/17
Modified By: Curtis Ling
#>

$OldVersions = @("SQL Server 2005","SQL Server 2008","Office 2000","Office 2002/XP","Office 2003","Office 2007","Windows XP","Windows XP x64 Edition","Windows Vista","Windows 8","Windows 8.1","Windows Server 2003","Windows Server 2003,Windows Server 2003, Datacenter Edition","Windows Server 2008","Windows Server 2012")

Function Invoke-SelectUpdatesPlugin{
    $DeclineUpdates = @{}
    $ProcessedUpdates = ($ActiveUpdates | Where-Object {($_.ProductTitles -in $OldVersions -and !$_.IsDeclined)})
	ForEach ($Update in $ProcessedUpdates){
		$DeclineUpdates.Set_Item($Update.Id.UpdateId,"Old Windows Version")
	}
    Return $DeclineUpdates
}
