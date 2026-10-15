Get-Process |
Sort-Object -Property WorkingSet64 -Descending |
Select-Object -First 10 |
Sort-Object -Property WorkingSet64 |
Select-Object -Property Name, Id, @{Name = 'megabaiti'; Expression = { [math]::Round($_.WorkingSet64 / 1MB, 1) }} |
Format-Table -AutoSize