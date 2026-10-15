$draiveri = Get-CimInstance -ClassName Win32_PnPSignedDriver |
    Where-Object -FilterScript { $_.DriverProviderName -and $_.DriverProviderName -ne 'Microsoft' } |
    Select-Object -Property DeviceName, DriverProviderName, DriverVersion

$draiveri | Export-Csv -Path "$PSScriptRoot\draiveri.csv" -NoTypeInformation -Encoding UTF8

Write-Output "Rindu skaits CSV failā: $(@($draiveri).Count)"
$draiveri | Format-Table -AutoSize