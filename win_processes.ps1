<#
.SNYNOPSIS Creates a csv of running processes.
.LINK https://github.com/mbleakley625/scripts/win_processes.ps1
.EMAIL mattbleakley625@gmail.com
#>

$TODAY = Get-date -Format ("yyyy-M-dd")
$PROCESSES=Get-Process

foreach($PROCESS in $PROCESSES){
    $NAME = $PROCESS.name
    $APP_DATE = $PROCESS.starttime
    #Subtracts todays date to the start-trime of process
    $HOURS = New-TimeSpan -start  $TODAY -end $APP_DATE | Select-Object -ExpandProperty hours
    #If it's less than 24 hours
    if($HOURS -le 24){
        #Adds entry to .csv file
        Get-Process $NAME | Select-Object name, id, starttime, description | Export-Csv C:\processes.csv -Append 
        }
}

#File object
$FILE = Import-Csv -Path C:\processes.csv 
$Services=Get-WmiObject win32_service | Select-Object ProcessId

#Opens File
foreach($INDEX in $FILE){
    
    $PROCESS_ID = $INDEX.id
    #Searches for matching Process ID from the file to its corresponding service ID
    $ID_MATCH = $Services | where {$_.ProcessId -eq $PROCESS_ID } 
    $NAME = $INDEX.name

    if ($ID_MATCH -AND $PROCESS_ID -ne 0 ){
        #Adds entry to html file
        Get-WmiObject win32_service | where {$_.ProcessId -eq $PROCESS_ID}  | ConvertTo-Html -Property ExitCode, Name, ProcessID, StartMode,State,Status | Out-File -FilePath C:\Services.htm -Append
    }
    
}


 