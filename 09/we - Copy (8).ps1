
Get-Process -IncludeUserName | Select-Object -Property Name, Id, UserName | Format-Table -AutoSize