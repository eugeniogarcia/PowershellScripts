$a=".mkv"

$lista=Get-ChildItem -Path .\

foreach ($arch in $lista) {
	$i=$arch.name.IndexOf($a)
	if ($i -le -1) {
		continue
	}
	$b=($arch.name.substring(0,$i)).Trim()
	$i=$b.LastIndexOf("-")
	if ($i -ge 0){
		$b=$b.substring($i+1)
		$b=$b.Trim()
	}
	$i=$b.IndexOf("(")-1
	if ($i -ge 0){
		$b=($b.substring(0,$i)).Trim()
	}
	$b=$b+$a
	Write-Host $b
	#rename-item -Path .\$arch -NewName $b
}
