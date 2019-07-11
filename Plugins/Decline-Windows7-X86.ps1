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
    $Windows10Updates = ($ActiveUpdates | Where {$_.ProductTitles -eq "Windows 7" -and !$_.IsDeclined})
    
    #Loop through the updates and decline any that match the architecture in the title
    ForEach ($Update in $Windows10Updates){

        #If the title contains a version number.
        If ($Update.Title -match "x86"){
                $DeclinedUpdates.Set_Item($Update.Id.UpdateId,"Windows 7 x86")
        }
    }
    Return $DeclinedUpdates
}
