#
# Zahlen raten
# Created by Sebastian Pech (www.spech.de)
#

Clear-Host

# Hilfsvariable um die Abfrage zu wiederholen
$isRunning = $true

# Die Funktion Spiel erhält als Parameter die größte zu ratende Zahl
function Spiel($max)
{
    # Hilfsvariable für die Wiederholung der Abfragen
    $raten = $true

    # Die zu ratende Zahl zufällig ermitteln
    $zahl = Get-Random -Minimum 1 -Maximum ($max+1)

    # Hilfsvariable für die Anzahl der Versuche
    $versuche = 0
	
    # Die Hauptschleife für das Raten
    while($raten)
    {
        # Jede Runde die Anzahl der Versuche erhöhen
        $versuche++

        # Auforderung für den Spieler ausgeben und Werte einlesen
        $eingabe = read-host "Bitte raten Sie die Zahl zwischen 1 und $max ($versuche)"
		
        # Die Eingabe des Benutzers in eine Zahl umwandeln, wenn möglich
        $out = 0
        if([int32]::TryParse($eingabe, [ref] $out)) {
            # Prüfen ob die Zahl zu hoch ist
            if($eingabe -gt $zahl) {
                "Ihre Eingabe war zu hoch."
            # Prüfen ob die Zahl zu niedrig ist
            } elseif($eingabe -lt $zahl) {
                "Ihre Eingabe war zu niedrig."
            # Die Zahl wurde erraten. Schleife abbrechen
            } else {
                $raten = $false
            }
        } else {
            # Umwandlung in eine Zahl nicht möglich - Fehler
            "Ungültige Eingabe: $eingabe"
        }
    }

    "Glückwunsch! Sie haben gewonnen in $versuche Versuchen!"
}

# Solange ausführen bis der Spieler eine korrekte Wahl getroffen hat
while($isRunning)
{
	# Ausgabe der Wahlmöglichkeiten
    write-host "BITTE AUSWÄHLEN:"
    write-host "    l) Leichtes Spiel"
    write-host "    m) Mittleres Spiel"
    write-host "    s) Schwieriges Spiel"
    write-host "    q) Beenden"
    write-host -nonewline "> "

	# Einlesen der Eingabe
    $eingabe = read-host

	# Auswertung der Eingabe und ggf. Start des Spiels mit der höchstmöglichen Zahl
    switch($eingabe)
    {
	    "l" { write-host "Leichtes Spiel gestartet"; Spiel(10) }
	    "m" { write-host "Mittleres Spiel gestartet"; Spiel(100) }
	    "s" { write-host "Schwieriges Spiel gestartet"; Spiel(1000) }
	    "q" { write-host "Auf Wiedersehen"; $isRunning = $false }
	    default { write-host "Ich verstehe dich nicht :-(" }
    }
}
