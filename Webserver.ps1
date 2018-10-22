#
# HTTP Listener - Mini Webserver
# Created by Sebastian Pech (www.spech.de)
#

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8080/")
$listener.Start()

while ($listener.IsListening)
{
    $context = $listener.GetContext()
    $response = $context.Response
    
    $buffer = [System.Text.Encoding]::UTF8.GetBytes("Dies ist ein test")
    $response.ContentLength64 = $buffer.Length
    $response.OutputStream.Write($buffer, 0, $buffer.Length)

    $response.Close()
}

Write-Host 'Quit'