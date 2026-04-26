$src  = "D:\Dropbox\Media_Materials\PZ_WEB\4x10.dev"
$dst  = "D:\GitHub\pavelzmunchila.com\media\4x10"
New-Item -ItemType Directory -Force -Path $dst | Out-Null
Get-ChildItem $src -File | Where-Object { $_.Extension -ne ".png" } | Copy-Item -Destination $dst -Force
$n = (Get-ChildItem $dst -File).Count
Write-Host ("Done: " + $n + " files copied to " + $dst)
