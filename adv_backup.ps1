param($ext)
$current=pwd

if(Test-Path C:\backup -PathType Container){
    Write-Host "--backup folder exists"
 }
 elseif(!(Test-Path C:\backup -PathType Container)){
 New-Item -path C:\ -Name backup -ItemType "directory"
 Write-Host "--backup does not exist"
}

Write-Host "--backing up "$ext
$files=Get-ChildItem -recurse -Include "*.$ext"

Copy-Item $files -Destination C:\backup -Recurse

$list = ls C:\backup
$list | Rename-Item -NewName {$_.Name + ".backup"}
#Foreach ($item in $list){
#    Rename-Item -newname {$item + ".backup"}
    
#   }




