#
# Merkspiel mit Windows Forms
# Created by Sebastian Pech (www.spech.de)
#

[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

$ratezeichen = "";

function ZahlenButtonGedrueckt($zahl, $label, $refForm)
{
    $text = $label.Text + "$zahl";
    $label.Text = $text;

    if($ratezeichen -eq $text) {        
        [System.Windows.Forms.MessageBox]::Show("Herzlichen Glückwunsch.`r`n" + "Punkte: " + ($text.Length), "Gewonnen!", 0)
        $refForm.Close();

    } elseif($ratezeichen.StartsWith($text)) {
        Write-Host "Passt: $text"

    } else {
        Write-Host "Falsch: $zahl - Bisher: $text - Korrekt: $ratezeichen"

        [System.Windows.Forms.MessageBox]::Show("Falsch: $zahl - Bisher: $text - Korrekt: $ratezeichen`r`n" + "Punkte: " + ($text.Length - 1), "Game Over!", 0)
        $refForm.Close();
    }
}

function StartButtonGeklickt()
{
    $label.text = "";
}

function StarteSpiel($max)
{
    $ratezeichen = "";
    for($i = 0; $i -lt $max; $i ++) 
    {
        $ratezeichen += Get-Random -InputObject 1,2,3 -Count 1 | % {"$_"}
    }
    Write-Host $ratezeichen

    $form = new-object Windows.Forms.Form
    $form.Text = "Merkspiel"
    $form.Size = New-Object Drawing.Size @(200, 240)
    $form.StartPosition = "CenterScreen"
        
    $labelRatezeichen = new-object Windows.Forms.Label
    $labelRatezeichen.Text = $ratezeichen
    $labelRatezeichen.Location = New-Object System.Drawing.Size(20, 20)
    $labelRatezeichen.Size = New-Object System.Drawing.Size(140, 40)
    
    $buttonStart = new-object Windows.Forms.Button
    $buttonStart.Text = "Start"
    $buttonStart.Location = New-Object System.Drawing.Size(20, 80)
    $buttonStart.Size = New-Object System.Drawing.Size(140, 40)
    $buttonStart.Add_Click({$form.Controls | ForEach-Object { $_.Enabled = $true; }; $labelRatezeichen.Text = ""; $buttonStart.Enabled = $false; })
        

    $buttonZahl1 = new-object Windows.Forms.Button
    $buttonZahl1.Text = "1"
    $buttonZahl1.Location = New-Object System.Drawing.Size(20, 140)
    $buttonZahl1.Size = New-Object System.Drawing.Size(40, 40)
    $buttonZahl1.Add_Click({ZahlenButtonGedrueckt "1" $labelRatezeichen $form;})
    $buttonZahl1.Enabled = $false;
    $form.Controls.Add($buttonZahl1)

    $buttonZahl2 = new-object Windows.Forms.Button
    $buttonZahl2.Text = "2"
    $buttonZahl2.Location = New-Object System.Drawing.Size(70, 140)
    $buttonZahl2.Size = New-Object System.Drawing.Size(40, 40)
    $buttonZahl2.Add_Click({ZahlenButtonGedrueckt "2" $labelRatezeichen $form;})
    $buttonZahl2.Enabled = $false;
    $form.Controls.Add($buttonZahl2)

    $buttonZahl3 = new-object Windows.Forms.Button
    $buttonZahl3.Text = "3"
    $buttonZahl3.Location = New-Object System.Drawing.Size(120, 140)
    $buttonZahl3.Size = New-Object System.Drawing.Size(40, 40)
    $buttonZahl3.Add_Click({ZahlenButtonGedrueckt "3" $labelRatezeichen $form;})
    $buttonZahl3.Enabled = $false;
    $form.Controls.Add($buttonZahl3)


    $form.Controls.Add($labelRatezeichen)
    $form.Controls.Add($buttonStart)
    $form.ShowDialog()
}

function Hauptmenue()
{
    $form = new-object Windows.Forms.Form
    $form.Text = "Merkspiel"
    $form.Size = New-Object Drawing.Size @(200, 240)
    $form.StartPosition = "CenterScreen"

    $buttonLeicht = new-object Windows.Forms.Button
    $buttonLeicht.Text = "Leicht"
    $buttonLeicht.Location = New-Object System.Drawing.Size(20, 20)
    $buttonLeicht.Size = New-Object System.Drawing.Size(140, 40)
    $buttonLeicht.Add_Click({StarteSpiel(10);})


    $buttonMittel = new-object Windows.Forms.Button
    $buttonMittel.Text = "Mittel"
    $buttonMittel.Location = New-Object System.Drawing.Size(20, 80)
    $buttonMittel.Size = New-Object System.Drawing.Size(140, 40)
    $buttonMittel.Add_Click({StarteSpiel(20);})


    $buttonSchwer = new-object Windows.Forms.Button
    $buttonSchwer.Text = "Schwer"
    $buttonSchwer.Location = New-Object System.Drawing.Size(20, 140)
    $buttonSchwer.Size = New-Object System.Drawing.Size(140, 40)
    $buttonSchwer.Add_Click({StarteSpiel(40);})

    $form.Controls.Add($buttonLeicht)
    $form.Controls.Add($buttonMittel)
    $form.Controls.Add($buttonSchwer)
    $form.ShowDialog()
}

Hauptmenue
