$operetajsistema = Get-CimInstance -ClassName Win32_OperatingSystem
$procesuSkaits = @(Get-Process).Count

Write-Output "Datora nosaukums: $env:COMPUTERNAME"
Write-Output "Operētājsistēma: $($operetajsistema.Caption)"
Write-Output "Būvējuma numurs: $($operetajsistema.BuildNumber)"
Write-Output "PowerShell versija: $($PSVersionTable.PSVersion)"
Write-Output "Datums un laiks: $(Get-Date)"
Write-Output "Darbojošos procesu skaits: $procesuSkaits"