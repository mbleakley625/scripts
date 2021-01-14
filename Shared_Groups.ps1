param($USER)
$GROUPS = Get-ADPrincipalGroupMembership $USER | Select-Object -ExpandProperty SAMAccountName
Write-Output "Groups belonging to $USER" $GROUPS
Write-Output " "

foreach($GROUP in $GROUPS)
{
    $B_USERS = Get-ADGroupMember -Identity $GROUP | Select-Object -ExpandProperty SAMAccountName
    foreach($B_USER in $B_USERS)
    {
        if($B_USER -ne $USER)
        {
            Write-Output "$B_USER also belongs in $GROUP"
        }
    }
}

