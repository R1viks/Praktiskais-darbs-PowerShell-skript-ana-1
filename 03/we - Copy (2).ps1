$darbojas = 0
$aptureti = 0
$visi = Get-Service

foreach ($serviss in $visi) {
    if ($serviss.Status -eq 'Running') {
        $darbojas = $darbojas + 1
    }
    if ($serviss.Status -eq 'Stopped') {
        $aptureti = $aptureti + 1
    }
}

Write-Output "Darbojas: $darbojas"
Write-Output "Apturēti: $aptureti"
Write-Output "Summa: $($darbojas + $aptureti)"
Write-Output "Kopējais servisu skaits: $($visi.Count)"