$src  = "D:\Dropbox\Media_Materials\PZ_WEB"
$repo = "D:\GitHub\pavelzmunchila.com"

$map = @(
    ,@("Projects\COIL",           "media\projects\coil")
    ,@("Projects\ANAKONDA",       "media\projects\anakonda")
    ,@("Projects\BEAMS",          "media\projects\beams")
    ,@("Projects\POST",           "media\projects\post")
    ,@("Projects\NINA KRAVIZ",    "media\projects\nina_kraviz")
    ,@("Projects\MEMORY",         "media\projects\memory")
    ,@("Projects\RHCP",           "media\projects\rhcp")
    ,@("Projects\Extrema",        "media\projects\extrema")
    ,@("Projects\Mahmut",         "media\projects\mahmut_orhan")
    ,@("Projects\Nechto",         "media\projects\nechto")
    ,@("Projects\Sophie",         "media\projects\sophie")
    ,@("Projects\ISE",            "media\projects\ise")
    ,@("Projects\Over and Above", "media\projects\over_above")
    ,@("Projects\Transmoderna",   "media\projects\transmoderna")
    ,@("Projects\TUBE",           "media\projects\tube")
    ,@("Concepts\Nine",           "media\concepts\nine")
    ,@("Concepts\NINE",           "media\concepts\nine")
    ,@("Concepts\Coil Infini",    "media\concepts\coil_infini")
    ,@("Concepts\COIL INFINI",    "media\concepts\coil_infini")
    ,@("Concepts\Skyfall",        "media\concepts\skyfall")
    ,@("Concepts\SKYFALL",        "media\concepts\skyfall")
    ,@("Concepts\Volumo",         "media\concepts\volumo")
    ,@("Concepts\VOLUMO",         "media\concepts\volumo")
    ,@("Concepts\Mono",           "media\concepts\mono")
    ,@("Concepts\MONO",           "media\concepts\mono")
    ,@("Concepts\Modo PT1",       "media\concepts\modo_pt1")
    ,@("Concepts\MODO PT1",       "media\concepts\modo_pt1")
    ,@("Concepts\Modo PT2",       "media\concepts\modo_pt2")
    ,@("Concepts\MODO PT2",       "media\concepts\modo_pt2")
    ,@("Concepts\Volt",           "media\concepts\volt")
    ,@("Concepts\VOLT",           "media\concepts\volt")
    ,@("Concepts\Linked",         "media\concepts\linked")
    ,@("Concepts\LINKED",         "media\concepts\linked")
    ,@("Concepts\Divid",          "media\concepts\divid")
    ,@("Concepts\DIVID",          "media\concepts\divid")
    ,@("Concepts\Lifeforms",      "media\concepts\lifeforms")
    ,@("Concepts\LIFEFORMS",      "media\concepts\lifeforms")
    ,@("Concepts\Cell",           "media\concepts\cell")
    ,@("Concepts\CELL",           "media\concepts\cell")
    ,@("Concepts\Radiata",        "media\concepts\radiata")
    ,@("Concepts\RADIATA",        "media\concepts\radiata")
    ,@("Concepts\Mass",           "media\concepts\mass")
    ,@("Concepts\MASS",           "media\concepts\mass")
    ,@("Concepts\Teta",           "media\concepts\teta")
    ,@("Concepts\TETA",           "media\concepts\teta")
    ,@("Concepts\Hemi",           "media\concepts\hemi")
    ,@("Concepts\HEMI",           "media\concepts\hemi")
    ,@("Concepts\Colo",           "media\concepts\colo")
    ,@("Concepts\COLO",           "media\concepts\colo")
    ,@("Concepts\Esse PT1",       "media\concepts\esse_pt1")
    ,@("Concepts\ESSE PT1",       "media\concepts\esse_pt1")
    ,@("Concepts\Esse PT2",       "media\concepts\esse_pt2")
    ,@("Concepts\ESSE PT2",       "media\concepts\esse_pt2")
    ,@("Concepts\Otta",           "media\concepts\otta")
    ,@("Concepts\OTTA",           "media\concepts\otta")
    ,@("About",                      "media\about")
)

$done = @{}
foreach ($entry in $map) {
    $from = Join-Path $src $entry[0]
    $to   = Join-Path $repo $entry[1]
    if ($done[$to]) { continue }
    if (Test-Path $from) {
        New-Item -ItemType Directory -Force -Path $to | Out-Null
        Get-ChildItem $from -File | Where-Object { $_.Extension -ne ".png" } | Copy-Item -Destination $to -Force
        $n = (Get-ChildItem $to -File).Count
        Write-Host ("OK  " + $entry[0] + "  (" + $n + " files)")
        $done[$to] = $true
    }
}
Write-Host "Done! Open GitHub Desktop -> Commit All -> Push"
