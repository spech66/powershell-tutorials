# Created by Sebastian Pech (www.spech.de)

# Namen / Names
$Namen = "Sarah", "Annabelle", "Johanna", "Lindsey", "Elaine"

# Eigenschaften / characteristics
$Eigenschaften = "abenteuerlustige", "böse", "chaotische", "erfinderische", "mutige", "risikofreudige"

# Klassen / profession
$Klassen = "Kriegerin", "Magierin", "Schurkin", "Adelige", "Bettlerin", "Händlerin"

# NAME is a CHARACTERISTIC PROFESSION
"{0} ist eine {1} {2}." -f ($Namen | Get-Random), ($Eigenschaften | Get-Random), ($Klassen | Get-Random)
