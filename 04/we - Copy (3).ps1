[CmdletBinding(SupportsShouldProcess = $true)]
param()

$apturetie = Get-Service | Where-Object -FilterScript {
    $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped'
}

if (@($apturetie).Count -eq 0) {
    Write-Output "Apturētu automātisko servisu skaits: 0"
}
else {
    foreach ($serviss in $apturetie) {
        Start-Service -Name $serviss.Name
        Write-Output "Apstrādāts serviss: $($serviss.Name)"
    }
}