#
# Read an print colored map
# Created by Sebastian Pech (www.spech.de)
#

# Go to script directory
Set-Location $PSScriptRoot
# Empty screen
Clear-Host

# Define variable to check if the main loop is running
$runGame = $true
$mapRaw = ""
$map = ""
$mapWidth = 0
$mapHeight = 0

# Show splash screen
Get-Content "screens/start.txt"

# Show information
Write-Host "Enter Q to exit game!"

# Wait
Write-Host "Press Enter to start" -NoNewline
Read-Host

function ReadMap($mapName)
{
    $global:mapRaw = Get-Content "maps/$mapName"
    $global:map = ""

    foreach ($line in $global:mapRaw)
    {
        if($line[0] -eq "?")
        {
            $param = $line.Substring(1)
            Write-Host "Found parameter: $param"
            $paramParts = $param.Split(" ")

            if($paramParts[0] -eq "SIZE")
            {
                $global:mapWidth = $paramParts[1]
                $global:mapHeight = $paramParts[2]
            }
        } else {
            $global:map += $line
        }
    }
}

function DrawMap()
{
    # Write-Host $global:map
    for($y = 0; $y -lt $global:mapHeight; $y++)
    {
		for($double = 0; $double -lt 2; $double++)
		{
			for($x = 0; $x -lt $global:mapWidth; $x++)
			{
				$char = $global:map[$x + $y * $global:mapWidth]
				switch($char)
				{
					'E' { Write-Host -NoNewline -ForegroundColor Black -BackgroundColor DarkRed '^^' }
					'#' { Write-Host -NoNewline -ForegroundColor Gray -BackgroundColor DarkGray '##' }
					'L' { Write-Host -NoNewline -ForegroundColor DarkGreen -BackgroundColor DarkGreen '  ' }
					'S' { Write-Host -NoNewline -ForegroundColor Yellow -BackgroundColor Yellow '  ' }
					'B' { Write-Host -NoNewline -ForegroundColor White -BackgroundColor White '  ' }
					'D' { Write-Host -NoNewline -ForegroundColor Black -BackgroundColor Black '  ' }
					'G' { Write-Host -NoNewline -ForegroundColor DarkGreen -BackgroundColor Green '**' }
					'J' { Write-Host -NoNewline -ForegroundColor DarkGray -BackgroundColor Gray '''''' }
					'W' { Write-Host -NoNewline -ForegroundColor DarkBlue -BackgroundColor Blue '~~' }
					default { Write-Host -NoNewline -ForegroundColor Black -BackgroundColor White '$char!' }
				}
			}
        Write-Host
		}
    }
}

ReadMap("home.txt")

# Main game loop
while($runGame)
{
    Clear-Host

    DrawMap

    # Prompt user for input
    Write-Host "> " -NoNewline
    $action = Read-Host
    $action = $action.Trim().ToLower()

    # Check user input
    if($action -eq "q")
    {
        $runGame = $false;
    }
}

# Show quit screen
Get-Content "screens/quit.txt"