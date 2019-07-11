﻿<#
.SYNOPSIS
Decline updates for editions of Windows 10 your organization does not support.
.DESCRIPTION
Decline updates for editions of Windows 10 your organization does not support.
.NOTES
You must un-comment the $SupportedEditions variable and add the editions your organization supports.
The KnownEditions variable holds a list of known editions to _try_ and prevent the script from going rogue if MS decides to change the naming scheme.  If ... or when ... they do this will need to be updated.
Written By: Bryan Dam
Version 1.0: 10/28/17
#>

#Un-comment and add elements to this array for editions you support.  Be sure to add a comma at the end in order to avoid confusion between editions.
$SupportedEditions = @("Feature update to Windows 10 Enterprise,","Feature update to Windows 10,")

#If Microsoft decides to change their naming scheme you will need to udpate this variable to support the new scheme.  Note that commas are used to prevent mismatches.
$KnownEditions=@("Feature update to Windows 10 Pro,","Feature update to Windows 10 Pro N,","Feature update to Windows 10 Enterprise,","Feature update to Windows 10 Enterprise N,", "Feature update to Windows 10 Education,","Feature update to Windows 10 Education N,","Feature update to Windows 10 Team,","Feature update to Windows 10,")
Function Invoke-SelectUpdatesPlugin{
    
    $DeclinedUpdates = @{}
    If (!$SupportedEditions){Return $DeclinedUpdates}    


    $Windows10Updates = ($ActiveUpdates | Where {$_.ProductTitles -eq "Windows 10" -and !$_.IsDeclined})
    
    #Loop through the updates and decline any that match the version.
    ForEach ($Update in $Windows10Updates){

        #Verify that the title matches one of the known edition.  If not then skip the update.
        $EditionFound=$False
        ForEach ($Edition in $KnownEditions){
            If ($Update.Title -match $Edition){$EditionFound=$True}
        }
        If(!$EditionFound){Continue} #Skip to the next update.

        #Verify that the title does not match any of the editions the user supports.
        $EditionFound=$False
        ForEach ($Edition in $SupportedEditions){
            If ($Update.Title -match $Edition){$EditionFound=$True}
        }
        
        #If one of the supportyed editions was found then skip to the next update.
        If($EditionFound){
            Continue #Skip to the next update.
        } Else {
            $DeclinedUpdates.Set_Item($Update.Id.UpdateId,"Windows 10 Edition")
        }        
    }
    Return $DeclinedUpdates
}
