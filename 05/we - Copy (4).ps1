$robeza = (Get-Date).AddHours(-48)
$kludas = @(Get-EventLog -LogName System -EntryType Error -After $robeza -ErrorAction SilentlyContinue)

Write-Output "Kļūdu skaits pēdējās 48 stundās: $($kludas.Count)"

if ($kludas.Count -gt 0) {
    $biezakais = $kludas | Group-Object -Property Source | Sort-Object -Property Count -Descending | Select-Object -First 1
    Write-Output "Biežākais avots: $($biezakais.Name) ($($biezakais.Count) reizes)"
}