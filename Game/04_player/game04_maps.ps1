#
# Add the player
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
$player = New-Object PSObject
Add-Member -InputObject $player -MemberType NoteProperty -Name x -Value 1
Add-Member -InputObject $player -MemberType NoteProperty -Name y -Value 0
Add-Member -InputObject $player -MemberType NoteProperty -Name symbol -Value '☺'

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
        for($x = 0; $x -lt $global:mapWidth; $x++)
        {
            $char = $global:map[$x + $y * $global:mapWidth]
			$foregroundColor = "Black"
			$backgroundColor = "White"
			
            switch($char)
            {
                'E' { $foregroundColor = "Black"; $backgroundColor = "DarkRed"; $char = '^' }
                '#' { $foregroundColor = "Gray"; $backgroundColor = "DarkGray"; $char = '#' }
                'L' { $foregroundColor = "DarkGreen"; $backgroundColor = "DarkGreen"; $char = ' ' }
                'S' { $foregroundColor = "Yellow"; $backgroundColor = "Yellow"; $char = ' ' }
                'B' { $foregroundColor = "White"; $backgroundColor = "White"; $char = ' ' }
                'D' { $foregroundColor = "Black"; $backgroundColor = "Black"; $char = ' ' }
                'G' { $foregroundColor = "DarkGreen"; $backgroundColor = "Green"; $char = '*' }
                'J' { $foregroundColor = "DarkGray"; $backgroundColor = "Gray"; $char = '''' }
                'W' { $foregroundColor = "DarkBlue"; $backgroundColor = "Blue"; $char = '~' }
                # default { Write-Host -NoNewline -ForegroundColor Black -BackgroundColor White '$char' }
            }
			
			if($x -eq $player.x -and $y -eq $player.y)
			{
				$foregroundColor = "Blue"
				$char = $player.symbol
			}
			
			Write-Host -NoNewline -ForegroundColor $foregroundColor -BackgroundColor $backgroundColor $char
        }
        Write-Host
    }
}

ReadMap("home.txt")

# Main game loop
while($runGame)
{
    Clear-Host

    DrawMap

	write-host $player.x $global:mapWidth
	write-host $player.y $global:mapHeight
	
    # Prompt user for input
    Write-Host "> " -NoNewline
    $action = Read-Host
    $action = $action.Trim().ToLower()

    # Check user input
	switch($action)
	{
		'q' { $runGame = $false; }
		'e' { $player.x++ }
		'w' { $player.x-- }
		'n' { $player.y-- }
		's' { $player.y++ }
	}
	
	if($player.x -lt 0) { $player.x = 0 }
	if($player.x -ge $global:mapWidth ) { $player.x = $global:mapWidth -1 }
	if($player.y -lt 0) { $player.y = 0 }
	if($player.y -ge $global:mapHeight ) { $player.y = $global:mapHeight -1 }
}

# Show quit screen
Get-Content "screens/quit.txt"