#
# First interaction
# Created by Sebastian Pech (www.spech.de)
#

# Go to script directory
Set-Location $PSScriptRoot
# Empty screen
Clear-Host

# Define variable to check if the main loop is running
$runGame = $true

# Show splash screen
Get-Content "screens/start.txt"

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

# Show quit screen
Get-Content "screens/quit.txt"