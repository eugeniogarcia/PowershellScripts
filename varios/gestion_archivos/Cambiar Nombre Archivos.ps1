Get-ChildItem -Path .\|%{$_.name.substring(0,20)}
Get-ChildItem -Path .\|%{rename-item -Path .\$_ -NewName $_.name.substring(0,25)}

$a=".mkv"

Get-ChildItem -Path .\|%{$i=$_.name.LastIndexOf("(")-1; $_.name.substring(0,$i)+$a}
Get-ChildItem -Path .\|%{$i=$_.name.LastIndexOf("(")-1; rename-item -Path .\$_ -NewName ($_.name.substring(0,$i)+$a)}
