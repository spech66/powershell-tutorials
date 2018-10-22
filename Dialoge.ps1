#
# Windows Forms und EventHandler
# Created by Sebastian Pech (www.spech.de)
#

# Variante 1:
# Jeder Button hat einen (kopierten) EventHandler für den Klick

function Hauptmenue1()
{
    $form = new-object Windows.Forms.Form
    $form.Size = New-Object Drawing.Size @(200, 240)

    $label1 = new-object Windows.Forms.Label
    $label1.Location = New-Object System.Drawing.Size(100, 20)
    $label2 = new-object Windows.Forms.Label
    $label2.Location = New-Object System.Drawing.Size(100, 80)
    $label3 = new-object Windows.Forms.Label
    $label3.Location = New-Object System.Drawing.Size(100, 140)

    $buttonLabel1 = new-object Windows.Forms.Button
    $buttonLabel1.Text = "Label 1"
    $buttonLabel1.Location = New-Object System.Drawing.Size(20, 20)
    $buttonLabel1.Add_Click({$label1.Text = "Label"; $label1.BackColor = "Green"; $label1.ForeColor = "Red"; })


    $buttonLabel2 = new-object Windows.Forms.Button
    $buttonLabel2.Text = "Label 2"
    $buttonLabel2.Location = New-Object System.Drawing.Size(20, 80)
    $buttonLabel2.Add_Click({$label2.Text = "Label"; $label2.BackColor = "Green"; $label2.ForeColor = "Red"; })


    $buttonLabel3 = new-object Windows.Forms.Button
    $buttonLabel3.Text = "Label 3"
    $buttonLabel3.Location = New-Object System.Drawing.Size(20, 140)
    $buttonLabel3.Add_Click({$label3.Text = "Label"; $label3.BackColor = "Green"; $label3.ForeColor = "Red"; })
    
    
    $form.Controls.Add($label1)
    $form.Controls.Add($label2)
    $form.Controls.Add($label3)
    $form.Controls.Add($buttonLabel1)
    $form.Controls.Add($buttonLabel2)
    $form.Controls.Add($buttonLabel3)
    $form.ShowDialog()
    
}

Hauptmenue1


return


# Variante 2:
# Jeder Button hat einen individuellen EventHandler für den Klick als Funktion ohne Parameter
# Labels müssen daher auch global sein

$variante2Label1 = $null;
$variante2Label2 = $null;
$variante2Label3 = $null;

function V2Label1Setzen()
{
    $variante2Label1.Text = "Label";
    $variante2Label1.BackColor = "Green";
    $variante2Label1.ForeColor = "Red"; 
}

function V2Label2Setzen()
{
    $variante2Label2.Text = "Label";
    $variante2Label2.BackColor = "Green";
    $variante2Label2.ForeColor = "Red"; 
}

function V2Label3Setzen()
{
    $variante2Label3.Text = "Label";
    $variante2Label3.BackColor = "Green";
    $variante2Label3.ForeColor = "Red"; 
}

function Hauptmenue2()
{
    $form = new-object Windows.Forms.Form
    $form.Size = New-Object Drawing.Size @(200, 240)

    $variante2Label1 = new-object Windows.Forms.Label
    $variante2Label1.Location = New-Object System.Drawing.Size(100, 20)
    $variante2Label2 = new-object Windows.Forms.Label
    $variante2Label2.Location = New-Object System.Drawing.Size(100, 80)
    $variante2Label3 = new-object Windows.Forms.Label
    $variante2Label3.Location = New-Object System.Drawing.Size(100, 140)

    $buttonLabel1 = new-object Windows.Forms.Button
    $buttonLabel1.Text = "Label 1"
    $buttonLabel1.Location = New-Object System.Drawing.Size(20, 20)
    $buttonLabel1.Add_Click({V2Label1Setzen;})


    $buttonLabel2 = new-object Windows.Forms.Button
    $buttonLabel2.Text = "Label 2"
    $buttonLabel2.Location = New-Object System.Drawing.Size(20, 80)
    $buttonLabel2.Add_Click({V2Label2Setzen;})


    $buttonLabel3 = new-object Windows.Forms.Button
    $buttonLabel3.Text = "Label 3"
    $buttonLabel3.Location = New-Object System.Drawing.Size(20, 140)
    $buttonLabel3.Add_Click({V2Label3Setzen;})
    
    
    $form.Controls.Add($variante2Label1)
    $form.Controls.Add($variante2Label2)
    $form.Controls.Add($variante2Label3)
    $form.Controls.Add($buttonLabel1)
    $form.Controls.Add($buttonLabel2)
    $form.Controls.Add($buttonLabel3)
    $form.ShowDialog()
    
}

Hauptmenue2

return

# Variante 3:
# Generische Funktion für alle Buttons, keine globalen Variablen

function LabelSetzen($label)
{
    $label.Text = "Label";
    $label.BackColor = "Green";
    $label.ForeColor = "Red"; 
}

function Hauptmenue3()
{
    $form = new-object Windows.Forms.Form
    $form.Size = New-Object Drawing.Size @(200, 240)

    $label1 = new-object Windows.Forms.Label
    $label1.Location = New-Object System.Drawing.Size(100, 20)
    $label2 = new-object Windows.Forms.Label
    $label2.Location = New-Object System.Drawing.Size(100, 80)
    $label3 = new-object Windows.Forms.Label
    $label3.Location = New-Object System.Drawing.Size(100, 140)

    $buttonLabel1 = new-object Windows.Forms.Button
    $buttonLabel1.Text = "Label 1"
    $buttonLabel1.Location = New-Object System.Drawing.Size(20, 20)
    $buttonLabel1.Add_Click({LabelSetzen $label1;})


    $buttonLabel2 = new-object Windows.Forms.Button
    $buttonLabel2.Text = "Label 2"
    $buttonLabel2.Location = New-Object System.Drawing.Size(20, 80)
    $buttonLabel2.Add_Click({LabelSetzen $label2;})


    $buttonLabel3 = new-object Windows.Forms.Button
    $buttonLabel3.Text = "Label 3"
    $buttonLabel3.Location = New-Object System.Drawing.Size(20, 140)
    $buttonLabel3.Add_Click({LabelSetzen $label3;})
    
    
    $form.Controls.Add($label1)
    $form.Controls.Add($label2)
    $form.Controls.Add($label3)
    $form.Controls.Add($buttonLabel1)
    $form.Controls.Add($buttonLabel2)
    $form.Controls.Add($buttonLabel3)
    $form.ShowDialog()
    
}

Hauptmenue3

return
