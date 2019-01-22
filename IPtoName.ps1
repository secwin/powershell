#$listofIPs = Get-Content IPlists.txt

$listofIPs = "IP1","IP2","IP3"
$ResultList = @()

foreach ($ip in $listofIPs){
	$result = $null
	$currentEAP = $ErrorActionPreference
	$ErrorActionPreference = "silentlycontinue"
	$result = [System.Net.Dns]::gethostentry($ip)
	$ErrorActionPreference = $currentEAP
	$Resoved = [string]$Result.HostName
If ($Result){$Resultlist += "$IP - $Resoved" }
else{$Resultlist += "$IP - Not fount hostname"}}
#$resultlist | Out-File output.txt
$ResultList

#Elimizdeki IP adreslerinin isimlerini çözmek için kullanılabilecek script
#With this script you can resolve hostname from list or group of IP addresses
#!Usage:
#1) Type your IP addresses insted of IP1,IP2,IP3..
#or
#1) Create IPlists.txt in same location with powershell script and import your IP addresses.




