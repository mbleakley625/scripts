
$GROUPS=Get-ADGroup -Filter * | Select-Object -ExpandProperty name 

foreach ($GROUP in $GROUPS ){

    Write-Output $group "--------------"
    #$TARGET=$GROUP | Out-String
  

    Get-ADGroupMember -identity $GROUP | select -ExpandProperty name
    Write-Output " "

}