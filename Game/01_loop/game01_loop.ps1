#
# Basic Loop for game
# Created by Sebastian Pech (www.spech.de)
#

# Define variable to check if the main loop is running
$runGame = $true

# Show information
Write-Host "Enter Q to exit game!"

# Main game loop
while($runGame)
{
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
