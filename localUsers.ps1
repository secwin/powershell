#You need DA privilage to get all user for remote machines#
get-content "IPlists.txt" | foreach-object { 
    $IP = $_ 
    if (test-connection -computername $IP -count 1 -quiet) { 
        ([ADSI]"WinNT://$comp").Children | ?{$_.SchemaClassName -eq 'user'} | %{ 
        $groups = $_.Groups() | %{$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)} 
        $_ | Select @{n='Server';e={$comp}}, 
        @{n='UserName';e={$_.Name}}, 
        @{n='Active';e={if($_.PasswordAge -like 0){$false} else{$true}}}, 
        @{n='PasswordExpired';e={if($_.PasswordExpired){$true} else{$false}}}, 
        @{n='PasswordAgeDays';e={[math]::Round($_.PasswordAge[0]/86400,0)}}, 
        @{n='LastLogin';e={$_.LastLogin}}, 
        @{n='Groups';e={$groups -join ';'}}, 
        @{n='Description';e={$_.Description}} 
        }  }
     Else {Write-Warning "'$IP' is unreachable"} 
     }|Export-Csv -NoTypeInformation localuserlists.csv 
 
 #Uzak bilgisayardaki lokal kullanıcıları isim, durum, parola durumu, son giriş zamanı, grubu ve açıklaması ile getiren script.
 #In order to get users from remote machine with user name, stuation, password stuation, last login time, group and description. 
 #!Usage:Create IPlists.txt in same location with powershell script and import your IP adresses.
