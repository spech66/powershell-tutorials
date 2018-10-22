# Created by Sebastian Pech (www.spech.de)

# Begegnungen definieren mit Wahrscheinlichkeit
# Encounter with probability
$Begegnungen = 
@([pscustomobject]@{Min=1; Max=6; Name="1W6 Schreckensratten"},
[pscustomobject]@{Min=7; Max=12; Name="1W6 Feuerkäfer"},
[pscustomobject]@{Min=13; Max=20; Name="1W6 Menschliche Skelette"},
[pscustomobject]@{Min=21; Max=24; Name="1W4 Riesentausendfüßler"},
[pscustomobject]@{Min=25; Max=26; Name="1 Spinnenschwarm"},
[pscustomobject]@{Min=27; Max=32; Name="1W6 Menschliche Zombies"})

# Maximale Wahrscheinlichkeit ermitteln und einen zufälligen Wert bestimmen
# Find maximum of probabilities and generate random value
$Max = $Begegnungen | foreach { $_.Max } | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
$Auswahl = Get-Random -Minimum 1 -Maximum ([int32]$Max+1)

# Begegnung darstellen
# Show encounter
$Begegnungen | Where-Object { $Auswahl -ge $_.Min -and $Auswahl -le $_.Max }
