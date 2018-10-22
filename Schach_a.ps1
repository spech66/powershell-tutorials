#
# Leeres Schachbrett darstellen
# Created by Sebastian Pech (www.spech.de)
#

Clear-Host

$buchstaben = "", "a", "b", "c", "d", "e", "f", "g", "h"

$color = $false
foreach($b in $buchstaben)
{
    Write-Host $b -NoNewline
    for($i = 0; $i -lt 9; $i++)
    {
        if($b -eq "" -and $i -gt 0) {
            write-host $i -NoNewline # zahlen
        } elseif($b -eq "") {
            write-host " " -NoNewline # obere linke ecke
        } elseif($b -ne "" -and $i -lt 8) {
            if($color) {
                Write-Host " " -BackgroundColor White -NoNewline
            } else {
                Write-Host " " -BackgroundColor Black -NoNewline
            }
            $color = !$color
        }
    }
    
    $color = !$color

    Write-Host
}