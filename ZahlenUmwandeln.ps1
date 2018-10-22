#
# Zahlen umwandeln
# Created by Sebastian Pech (www.spech.de)
#

Clear-Host

$zahl = read-host "zahl: "

# SCHLECHT
[int]$echtezahl = [convert]::ToInt32($zahl)

# GUT
$out = 0
if([int32]::TryParse($zahl, [ref] $out)) {
    "Zahl:  $out"
} else {
    "Text: $zahl"
}


$zahl.GetType()
$echtezahl.GetType()
$out.GetType()