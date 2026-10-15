$robezaGB = 20

$diski = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
foreach ($disks in $diski) {
    $kopejaisGB = [math]::Round($disks.Size / 1GB, 1)
    $brivaisGB = [math]::Round($disks.FreeSpace / 1GB, 1)
    Write-Output "Disks $($disks.DeviceID) | Kopā: $kopejaisGB GB | Brīvs: $brivaisGB GB"
    if ($brivaisGB -lt $robezaGB) {
        Write-Warning "Disks $($disks.DeviceID): brīvas vietas ir mazāk par $robezaGB GB!"
    }
}