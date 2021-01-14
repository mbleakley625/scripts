param($pro_id)

while($true)
{
    if ((Get-Process | Where-Object { $_.id -eq $pro_id }) -eq $NULL){
        "Process is not running"
        break

        }
        else{
        "Yup, it's still there"
         Get-Process -Id $pro_id 
         
         sleep -Seconds 5
    }
    }
 



