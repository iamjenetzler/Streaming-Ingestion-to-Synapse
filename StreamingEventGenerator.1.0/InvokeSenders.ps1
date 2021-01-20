$senderInstances=10 #Invoke several senders, but not too many so EH doesn't get throttled.
$totalHours=240 #for how long to keep the senders running

$resetSendersDurationSeconds=3600 #kill and restart senders so they stay healthy
#find exe and save executable path as command
$file=".\SensorEventGenerator.exe";
$files = gci -r SensorEventGenerator.exe | % { $_.FullName }
if ($files -ne $null -and $files.Count -gt 0)
{
    if ($files.Count -gt 1)
    {
        $file = $files[0];
    }
	
	Write-Host ("Executing " + $file);
}
else {
    Write-Warning ("Could not find " + $file)
    Write-Warning "Please build project and ensure the file exists"
}

for ($j=0; $j -le $totalHours; $j++) 
{
    Stop-Process -Name @("SensorEventGenerator") -ErrorAction SilentlyContinue
    sleep -Seconds 1; 
    
    for ($i=0; $i -le $senderInstances; $i++) 
    { 
        Start-Process $file -WindowStyle Minimized; 
        sleep -Milliseconds (Get-Random 100);
    }; 
    sleep -Seconds $resetSendersDurationSeconds 
}

