#$listofIPs = Get-Content c:\user\X\Desktop\IPlist.txt

$listofIPs = "<b>IP1</b>","<b>IP2</b>","<b>IP3</b>"
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
#$resultlist | Out-File c:\user\X\Desktop\output.txt
$ResultList

#With this script you can resolve hostname from list or group of IP addresses
#You can;
#1) Add your IP addresses to "$listofIPs = "<b>IP1</b>","<b>IP2</b>","<b>IP3</b>""
#or
#1) Change path of IP list path from "$listofIPs = Get-Content <b>c:\user\X\Desktop\IPlist.txt</b>" code
#2) Change path of result path from "$resultlist | Out-File <b>c:\user\X\Desktop\output.txt</b>" code
