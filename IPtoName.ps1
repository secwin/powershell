#$listofIPs = Get-Content c:\IPList.txt

$listofIPs = "<b>IP1</b>","<b>IP2</b>","<b>IP3</b>"
$ResultList = @()
foreach ($ip in $listofIPs)

{

     $result = $null
     $currentEAP = $ErrorActionPreference
     $ErrorActionPreference = "silentlycontinue"
     $result = [System.Net.Dns]::gethostentry($ip)
     $ErrorActionPreference = $currentEAP
	 $Resoved = [string]$Result.HostName
     If ($Result)
     {$Resultlist += "$IP - $Resoved" }
     else{$Resultlist += "$IP - No HostNameFound"}

}
#$resultlist | Out-File c:\output.txt
$ResultList