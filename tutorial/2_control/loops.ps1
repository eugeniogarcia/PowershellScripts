$archivos=Get-ChildItem .\picoGPT\ -Recurse
ForEach ($archivo in $archivos) {
     write-host "archivo $($archivo.BaseName)"
}

write-host $archivos[0]

