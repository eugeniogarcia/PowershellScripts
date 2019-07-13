Start-Job -Name dashboard -ScriptBlock {minikube dashboard} 
Get-Job


Start-Job -ScriptBlock {Get-Process}
Start-Job -name mijob -ScriptBlock {Get-Process}

$j = Start-Job -ScriptBlock {Get-EventLog -Log system} -Credential domain01\user01

$j | Format-List -Property *

$j.JobStateInfo.state

# This command uses the Invoke-Command cmdlet and its AsJob parameter to start a background job that runs a command on many computers. Because the command is running on a server that has significant network traffic, the command uses the ThrottleLimit parameter of Invoke-Command to limit the number of concurrent commands to 16.
$jobWRM = Invoke-Command -ComputerName (Get-Content servers.txt) -ScriptBlock {Get-Service winrm} -JobName "WinRM" -ThrottleLimit 16 -AsJob

# his command runs the Sample.ps1 script as a background job.
Start-Job -FilePath "c:\scripts\sample.ps1"

# This command starts a job that collects lots of data, and then saves it in a .tif file. The command uses the InitializationScript parameter to run a script block that imports a required module. It also uses the RunAs32 parameter to run the job in a 32-bit process even if the computer has a 64-bit operating system.
Start-Job -Name GetMappingFiles -InitializationScript {Import-Module MapFunctions} -ScriptBlock {Get-Map -Name * | Set-Content D:\Maps.tif} -RunAs32

# Pass input to a background job
Start-Job -ScriptBlock {Write-Output $Input} -InputObject 'Hello, world!'