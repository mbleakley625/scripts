param($days)
$current = pwd
$date = get-date -Format yyyy-MM-dd
$archive_filename = "C:\archive " + ($date)
Get-ChildItem -Path $current -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$days))} | 
Compress-Archive -DestinationPath $archive_filename