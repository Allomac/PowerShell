Invoke-Command 
 
Invoke-command by default maxes out at 32 systems 
 
Invoke-Command -Scriptblock { get-process } -computername lon-cl1,lon-dc1 
 
$dc = New-PSSession -Computername LON-DC1 
Get-Module -listavailable -pssession $dc | where {$_.Name -like "*share*'} 
 
#Import Remote Module 
Import-Module -PSSession $dc -Name SMBShare -Prefix DC 
 
$Computers = New-PSSession -Computername LON-DC1,LON-CL1 
