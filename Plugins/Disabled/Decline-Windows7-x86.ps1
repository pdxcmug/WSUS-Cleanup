<#
.SYNOPSIS
Decline Windows 7 32-Bit updates
.DESCRIPTION
Decline Windows 7 32-Bit updates
.NOTES
N/A
Written By: Bryan Dam
Version 1.0: 10/25/17
Modified By: Curtis Ling
#>

Function Invoke-SelectUpdatesPlugin{

    $DeclinedUpdates = @{}
    $Windows7Updates = ($ActiveUpdates | | Where-Object { ($_.ProductTitles -eq "Windows 7") -and ($_.Title -match "x86") -and !$_.IsDeclined})
    
    #Loop through the updates and decline any that match the architecture in the title
    ForEach ($Update in $Windows7Updates){
                $DeclinedUpdates.Set_Item($Update.Id.UpdateId,"Windows 7 x86")
    }
    Return $DeclinedUpdates
}
