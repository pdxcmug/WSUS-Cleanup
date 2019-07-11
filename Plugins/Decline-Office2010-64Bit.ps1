<#
.SYNOPSIS
Decline Office 2010 64-Bit updates
.DESCRIPTION
Decline Office 2010 64-Bit updates
.NOTES
N/A
Written By: Bryan Dam
Version 1.0: 10/25/17
Modified By: Curtis Ling
#>

Function Invoke-SelectUpdatesPlugin{

    $DeclinedUpdates = @{}
    $Office2010Updates = ($ActiveUpdates | Where {$_.ProductTitles -eq "Office 2010" -and !$_.IsDeclined})
    
    #Loop through the updates and decline any that match the architecture in the title
    ForEach ($Update in $Office2010Updates){

        #If the title contains a version number.
        If ($Update.Title -match "64-Bit"){
                $DeclinedUpdates.Set_Item($Update.Id.UpdateId,"Office 2010 64-Bit")
        }
    }
    Return $DeclinedUpdates
}
