$Users = Import-Csv -Path C:\Users\Administrator\Desktop\marvel_users.csv

foreach ($User in $Users)
{
    $FIRSTLAST = $user.firstname + " " + $user.lastname
    $SAM = $user.username
    $FIRSTNAME = $user.firstname
    $LASTNAME = $user.lastname
    $DEPARTMENT = $user.department
    $PROVINCE = $user.province
    $PASSWORD = $user.password
    $OU = $user.ou
    $IDENTITY = $user.identity
   

    New-ADUser "$FIRSTLAST" -DisplayName "$FIRSTLAST" -SamAccountName "$SAM" -GivenName "$FIRSTNAME" -Surname "$LASTNAME" -Department "$DEPARTMENT" -City "$PROVINCE" -AccountPassword (ConvertTo-SecureString $PASSWORD -AsPlainText -Force ) -Enabled $true -Path "CN=Users,DC=xyz,DC=com" -ChangePasswordAtLogon $false
    if (@(Get-ADGroup -Filter { SamAccountName -eq $DEPARTMENT }).Count -eq 0){
        New-ADGroup -Name $DEPARTMENT -SamAccountName $DEPARTMENT -GroupCategory Security -GroupScope DomainLocal
        Write-Output " $SAM -- > $DEPARTMENT "
    }
    else
    {
         Write-Output "$SAM -- > $DEPARTMENT "
    }
    Add-ADGroupMember -identity $DEPARTMENT -Members $SAM
   if ($IDENTITY -eq "LocalAdmins")
    {
        Add-ADGroupMember -identity "Administrators" -members "$SAM"
        Write-Output "$SAM -- > Administrators"
    }
    else
    {
        Add-ADGroupMember -identity "$IDENTITY" -Members $SAM
}
}