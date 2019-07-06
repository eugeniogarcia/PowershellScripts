Function bautiza{
Param ($directorio, $largo, $try)

if($try -eq $null){
    $try=$false
}

$archivos=Get-ChildItem -Path $directorio -File 

foreach ($a in $archivos){
    Write-Output "Procesa $a.Name"

    if($a -match '^.*\.\w{1,3}$'){
        $longitud=[Int]$a.Name.Length
        if([Int]$largo -lt $longitud-4){
            $origen=$directorio+'\'+$a.Name
            $destino=$directorio+'\'+$a.Name.Substring(0,[Int]$largo)+$a.Name.Substring($a.Name.LastIndexOf('.'))

            if($try){
                Rename-Item -Path $origen $destino 
            }
            else{
                Write-Output $destino 
            }
        }
    }
    else{
        $longitud=[Int]$a.Name.Length

        if([Int]$largo -lt $longitud){
            $origen=$directorio+'\'+$a.Name.Substring(0,[Int]$largo)
            $destino=$directorio+'\'+$a.Name.Substring(0,[Int]$largo)

            if($try){
                Rename-Item -Path $origen $destino 
            }
            else{
                Write-Output $destino 
            }        
        }
    }

}
}


bautiza f:\completados 14 $true