#
# Schachbrett darstellen mit Testfiguren
# Created by Sebastian Pech (www.spech.de)
#

Clear-Host

$buchstaben = "a", "b", "c", "d", "e", "f", "g", "h"
$spielfeld = "bbbbbbbb",
"        ",
"        ",
"        ",
"        ",
"        ",
"        ",
"rrrrrrrr"

$color = $false

# zahlen
for($i = 0; $i -lt 9; $i++)
{
    if($i -gt 0) {
        write-host "$i" -NoNewline
    } else {
        write-host " " -NoNewline
    }
}
Write-Host

for($reihe = 0; $reihe -lt $buchstaben.Count; $reihe++)
{
    Write-Host $buchstaben[$reihe] -NoNewline

    for($i = 0; $i -lt 8; $i++)
    {
        # Zeichen an der Stelle x/y ermitteln
        $zeichen = $spielfeld[$reihe][$i];

        # Farbe ermitteln
        $zeichenFarbe = "blue"
        if($zeichen -eq "r") {
            $zeichenFarbe = "red"
        }

        # Platzhalter in X umwandeln
        if($zeichen -ne " ") {
            $zeichen = "X"
        }

        # Ausgabe
        if($color) {
            Write-Host $zeichen -BackgroundColor White -NoNewline -ForegroundColor $zeichenFarbe
        } else {
            Write-Host $zeichen -BackgroundColor Black -NoNewline -ForegroundColor $zeichenFarbe
        }
        # Farbe negieren
        $color = !$color
    }
    
    # Farbe negieren
    $color = !$color

    Write-Host
}