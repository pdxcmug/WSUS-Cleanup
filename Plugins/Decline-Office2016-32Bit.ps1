<#
.SYNOPSIS
Decline Office 2016 32-Bit updates
.DESCRIPTION
Decline Office 2016 32-Bit updates
.NOTES
N/A
Written By: Bryan Dam
Version 1.0: 10/25/17
Modified By: Curtis Ling
#>

Function Invoke-SelectUpdatesPlugin{

    $DeclinedUpdates = @{}
    $Office2016Updates = ($ActiveUpdates | Where {$_.ProductTitles -eq "Office 2016" -and !$_.IsDeclined})
    
    #Loop through the updates and decline any that match the architecture in the title
    ForEach ($Update in $Office2016Updates){

        #If the title contains a version number.
        If ($Update.Title -match "32-Bit"){
                $DeclinedUpdates.Set_Item($Update.Id.UpdateId,"Office 2016 32-Bit")
        }
    }
    Return $DeclinedUpdates
}
