param([string] $ComputerName = 'localhost',[datetime]$StartTimestamp,[datetime]$EndTimestamp)

$logs = (Get-WinEvent -ListLog * -ComputerName $ComputerName | where {$_.RecordCount}).Logname
$FilterTable = @{
        'StartTime' = $StartTimestamp
        'EndTime' = $EndTimestamp
        'LogName' = $logs
}

Get-WinEvent -ComputerName $ComputerName -FilterHashtable $FilterTable -ErrorAction 'SilentlyContinue'

<#Kullanımı/Usage:  .\Get-WinEventWithin.ps1 -ComputerName <t>IP or Computer Name </t> -StartTimestamp 'mm.dd.yyyy hh:mm' -EndTimestamp 'mm.dd.yyyy hh:mm'  #>
