param($GROUP)

Write-Output "$GROUP members: "    
Get-ADGroupmember -Identity $GROUP | select-object name