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
    Write-Output $FIRSTLAST

    Remove-ADUser -Identity $SAM -Confirm:$false
    if (@(Get-ADGroup -Filter { SamAccountName -eq $DEPARTMENT }).Count -eq 1){
       Remove-ADGroup -Identity $DEPARTMENT -Confirm:$false
    }
    
   
}