#
# Ping Dialog
# Created by Sebastian Pech (www.spech.de)
#

Clear-Host

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$form = New-Object Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(600, 400)
$form.Text = "Ping"

$btn = New-Object Windows.Forms.Button
$btn.Width = 120
$btn.Location = New-Object System.Drawing.Point(460, 10)
$btn.Text = "Ping Host"

$btn.Add_Click({
    $a = ping $txt.Text | Out-String
    $area.Text = $a
})

$lbl = New-Object Windows.Forms.Label
$lbl.Width = 40
$lbl.Location = New-Object System.Drawing.Point(10, 12)
$lbl.Text = "Host:"

$txt = New-Object Windows.Forms.TextBox
$txt.Width = 400
$txt.Location = New-Object System.Drawing.Point(50, 10)
$txt.Text = "127.0.0.1"

$form.Controls.Add($btn)
$form.Controls.Add($lbl)
$form.Controls.Add($txt)

$area = New-Object Windows.Forms.TextBox
$area.Width = 570
$area.Height = 310
$area.Multiline = $true
$area.ReadOnly = $true
$area.Location = New-Object System.Drawing.Point(10, 40)
$area.Text = ""
$area.Font = New-Object System.Drawing.Font("Courier New",10,0,3,0)
$form.Controls.Add($area)

$form.ShowDialog()
