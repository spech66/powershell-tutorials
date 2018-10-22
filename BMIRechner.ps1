#
# BMI Rechner
# Created by Sebastian Pech (www.spech.de)
#

function Berechnen()
{
    $m = [int32]$textMasse.Text
    $l = [int32]$textGroesse.Text
    $t = [int32]$cbAlter.Text

    $istFrau = $radioBtnFrau.Checked

    # https://de.wikipedia.org/wiki/Body-Mass-Index
    $bmi = [Math]::Round($m / ($l * $l) * 10000)

    # https://de.wikipedia.org/wiki/Grundumsatz
    $s = $index = switch ($istFrau) { $true { -161.0 } default { +5 } }
    $grundumsatz = [Math]::Round(10.0 * $m + 6.25 * $l - 5.0 * $t + $s)

    $labelBMI.Text = "        BMI: $bmi"
    $labelGrundumsatz.Text = "Grundumsatz: $grundumsatz "
}

[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

$form = new-object Windows.Forms.Form
$form.Size = New-Object Drawing.Size @(400, 600)

$labelMasse = New-Object Windows.Forms.Label
$labelMasse.Location = New-Object System.Drawing.Point(20, 20)
$labelMasse.Width = 300
$labelMasse.Text = "Körpermasse (in Kilogramm)"
$form.Controls.Add($labelMasse)

$textMasse = New-Object Windows.Forms.MaskedTextBox
$textMasse.Mask = "990"
$textMasse.Location = New-Object System.Drawing.Point(40, 45)
$textMasse.Width = 60
$textMasse.Text = "80"
$textMasse.Add_TextChanged({Berechnen})
$form.Controls.Add($textMasse)

$labelGroesse = New-Object Windows.Forms.Label
$labelGroesse.Location = New-Object System.Drawing.Point(20, 80)
$labelGroesse.Width = 300
$labelGroesse.Text = "Körpergröße (in Metern) "
$form.Controls.Add($labelGroesse)

$textGroesse = New-Object Windows.Forms.MaskedTextBox
$textGroesse.Mask = "990"
$textGroesse.Location = New-Object System.Drawing.Point(40, 105)
$textGroesse.Width = 60
$textGroesse.Text = "180"
$textGroesse.Add_TextChanged({Berechnen})
$form.Controls.Add($textGroesse)

$labelAlter = New-Object Windows.Forms.Label
$labelAlter.Location = New-Object System.Drawing.Point(20, 140)
$labelAlter.Width = 300
$labelAlter.Text = "Alter (in Jahren)"
$form.Controls.Add($labelAlter)

$cbAlter = New-Object Windows.Forms.ComboBox
$cbAlter.Location = New-Object System.Drawing.Point(40, 165)
$cbAlter.Width = 60
$cbAlter.Items.AddRange(18..60)
$cbAlter.SelectedItem = 25
$cbAlter.DropDownStyle = "DropDownList"
$cbAlter.Add_SelectedIndexChanged({Berechnen})
$form.Controls.Add($cbAlter)

$groupBox = new-object Windows.Forms.GroupBox
$groupBox.Text = "Geschlecht"
$groupBox.Location = New-Object System.Drawing.Size(20, 200)
$form.Controls.Add($groupBox)

$radioBtnFrau = new-object Windows.Forms.RadioButton
$radioBtnFrau.Text = "Frau"
$radioBtnFrau.Checked = $true
$radioBtnFrau.Location = New-Object System.Drawing.Size(20, 20)
$radioBtnFrau.Add_CheckedChanged({Berechnen})
$groupBox.Controls.Add($radioBtnFrau)
$radioBtnMann = new-object Windows.Forms.RadioButton
$radioBtnMann.Text = "Mann"
$radioBtnMann.Location = New-Object System.Drawing.Size(20, 60)
$groupBox.Controls.Add($radioBtnMann)


#$buttonRechnen = New-Object Windows.Forms.Button
#$buttonRechnen.Location = New-Object System.Drawing.Point(20, 320)
#$buttonRechnen.Size = New-Object System.Drawing.Size(200, 30)
#$buttonRechnen.Text = "Berechnen"
#$buttonRechnen.Add_Click({Berechnen})
#$form.Controls.Add($buttonRechnen)


$labelBMI = New-Object Windows.Forms.Label
$labelBMI.Location = New-Object System.Drawing.Point(20, 400)
$labelBMI.Font = New-Object System.Drawing.Font("Courier New", 18)
$labelBMI.Width = 300
$labelBMI.Text = "        BMI"
$form.Controls.Add($labelBMI)

$labelGrundumsatz = New-Object Windows.Forms.Label
$labelGrundumsatz.Location = New-Object System.Drawing.Point(20, 440)
$labelGrundumsatz.Font = New-Object System.Drawing.Font("Courier New", 18)
$labelGrundumsatz.Width = 300
$labelGrundumsatz.Text = "Grundumsatz"
$form.Controls.Add($labelGrundumsatz)

Berechnen

$form.ShowDialog()
