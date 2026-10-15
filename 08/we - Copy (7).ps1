$laiks1 = Measure-Command -Expression { Get-Service -Name Spooler | Out-Null }
$laiks2 = Measure-Command -Expression { Get-CimInstance -ClassName Win32_Service -Filter "Name='Spooler'" | Out-Null }

Write-Output "Get-Service: $([math]::Round($laiks1.TotalMilliseconds, 2)) ms"
Write-Output "Get-CimInstance: $([math]::Round($laiks2.TotalMilliseconds, 2)) ms"