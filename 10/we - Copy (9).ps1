$procesuSkaits = @(Get-Process).Count

$darbojas = 0
$aptureti = 0
foreach ($serviss in Get-Service) {
    if ($serviss.Status -eq 'Running') { $darbojas = $darbojas + 1 }
    if ($serviss.Status -eq 'Stopped') { $aptureti = $aptureti + 1 }
}

$kludas = @(Get-EventLog -LogName System -EntryType Error -After (Get-Date).AddHours(-48) -ErrorAction SilentlyContinue)

Write-Output "Procesu skaits: $procesuSkaits"
Write-Output "Darbojošies servisi: $darbojas"
Write-Output "Apturētie servisi: $aptureti"
Write-Output "Kļūdu skaits pēdējās 48 h: $($kludas.Count)"
foreach ($disks in Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3") {
    Write-Output "Disks $($disks.DeviceID) brīvs: $([math]::Round($disks.FreeSpace / 1GB, 1)) GB"
}