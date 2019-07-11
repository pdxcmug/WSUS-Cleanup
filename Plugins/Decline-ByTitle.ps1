<#
.SYNOPSIS
Replaces the -DeclinByTitle Parameter
.DESCRIPTION
Replaces the -DeclinByTitle Parameter
.NOTES
N/A
Written By: Curtis Ling
Version 1.0: 2019-01-09
#>

$TitlesLike = @("*Itanium*","*IA64*","*ARM64*","*Beta*","*Preview*","*Version Next*","*Language Pack*")
$LegacyNameLike = @("*-IA64-*")
Function Invoke-SelectUpdatesPlugin{
    $DeclineUpdates = @{}
	$SelectedUpdates = @()
	ForEach($LegacyName in $LegacyNameLike){ $SelectedUpdates += ($ActiveUpdates | Where LegacyName -like $LegacyName ) }
    ForEach($Title in $TitlesLike){ $SelectedUpdates += ($ActiveUpdates | Where Title -like $Title ) }
	ForEach ($Update in $SelectedUpdates) {
        $DeclineUpdates.Set_Item($Update.Id.UpdateId,"Decline by Title")
    }
    Return $DeclineUpdates
}
