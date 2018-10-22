# Created by Sebastian Pech (www.spech.de)

# Roll 1D6 1W6
Get-Random -Minimum 1 -Maximum 7
1..6 | Get-Random

# Roll 1D20 1W20
Get-Random -Minimum 1 -Maximum 21
1..20 | Get-Random

# Roll 2D20 2W20
$Seiten = 20
$Anzahl = 2
(1..$Seiten)*$Anzahl | Get-Random -Count $Anzahl

# 2D20+4
(((1..$Seiten)*$Anzahl | Get-Random -Count $Anzahl) | Measure-Object -Sum).Sum + 4

# 4d6 drop lowest - take only the 3 highest rolls
(1..6)*4 | Get-Random -Count 4 | Sort-Object | Select -Last 3 | Measure-Object -Sum | Select -ExpandProperty Sum
