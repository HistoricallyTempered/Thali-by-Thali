
Add-Type -AssemblyName System.Drawing

$basePath = "e:\Antigravity\HTwebsite\assets"

function Convert-TiffToPng {
    param ($source, $dest)
    try {
        $img = [System.Drawing.Image]::FromFile($source)
        $img.Save($dest, [System.Drawing.Imaging.ImageFormat]::Png)
        $img.Dispose()
        Write-Host "Converted $source to $dest"
    } catch {
        Write-Host "Error converting $source : $_"
    }
}

function Rename-File {
    param ($source, $dest)
    try {
        if (Test-Path $source) {
            Rename-Item -Path $source -NewName $dest -Force
            Write-Host "Renamed $source to $dest"
        } else {
            Write-Host "File not found: $source"
        }
    } catch {
        Write-Host "Error renaming $source : $_"
    }
}

# Episode 1 (TIFF to PNG)
$ep1Source = Join-Path $basePath "Harappans - Episode 01.tif"
$ep1Dest = Join-Path $basePath "thumbnail-1.png"
if (Test-Path $ep1Source) {
    Convert-TiffToPng -source $ep1Source -dest $ep1Dest
}

# Episode 2 (Rename PNG)
$ep2Source = Join-Path $basePath "Early Indians - Episode 02.png"
Rename-File -source $ep2Source -dest "thumbnail-2.png"

# Episode 3 (Rename JPEG, handle typo)
$ep3Source = Join-Path $basePath "Early South Indians - Episode 04.jpeg"
Rename-File -source $ep3Source -dest "thumbnail-3.jpg"

# Episode 4 (Rename JPEG)
$ep4Source = Join-Path $basePath "Guptas - Episode 04.jpeg"
Rename-File -source $ep4Source -dest "thumbnail-4.jpg"
