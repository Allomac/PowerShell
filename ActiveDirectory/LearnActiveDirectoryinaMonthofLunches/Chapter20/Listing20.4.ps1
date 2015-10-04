﻿##
## test SRV records
##
$dom = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
foreach ($dc in $dom.DomainControllers){
  Get-DnsServerResourceRecord -RRType SRV -ComputerName server02 -ZoneName manticore.org | 
  where {$_.RecordData.DomainName -eq "$dc."} |
  sort hostname |
  Format-Table -AutoSize
} 