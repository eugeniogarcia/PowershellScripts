Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)

#Comprueba si existe la ruta
If (-Not (Test-Path $Path)) 
{
  #arroja una excepción
  Throw "The source directory $Path does not exist, please specify an existing directory"
}

#obtenemos la fecha
$date = Get-Date -format "yyyy-MM-dd"

#evaluamos una expresion dentro del string
$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
If (-Not (Test-Path $DestinationFile)) 
{
  #comprime el archivo
  Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
  
  Write-Host "Created backup at $($DestinationPath + 'backup-' + $date + '.zip')"
} Else {
  Write-Error "Today's backup already exists"
}