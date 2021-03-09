findstr /S /snip /c:"/x.js" C:\inetpub\logs\LogFiles\*.log > hunt.txt
findstr /S /snip /c:"/y.js" C:\inetpub\logs\LogFiles\*.log >> hunt.txt

$regex=‘(?<Address>((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))’

$Matched = select-string -Path hunt.txt -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value }



$uniques = $Matched |Select-Object -Unique |Sort-Object

$uniques

write-host "Please remove any local data e.g. private IP addresses before sharing" -ForegroundColor Red

write-host "Share IPs at : https://github.com/PwnDefend/badExchangePews" -ForegroundColor Green

#Created by #mRr3b00t to help the community
