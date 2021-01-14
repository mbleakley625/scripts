param($user_file)
$pass = Read-Host -AsSecureString "Password1!"

$users = Get-Content $user_file
foreach($user in $users){
    New-LocalUser -name $user -Password $pass
    }