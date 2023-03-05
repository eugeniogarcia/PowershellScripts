#añadimos un parametro de tipo switch
Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
  [switch]$PathIsWebApp
)

#Comprueba si existe la ruta
If (-Not (Test-Path $Path)) 
{
  #arroja una excepción
  Throw "The source directory $Path does not exist, please specify an existing directory"
}

#Si hemos activado el switch
If ($PathIsWebApp -eq $True) {
   Try 
   {
    #comprobamos si en el directorio tenemos algun archivo con extension js, html o css
     $ContainsApplicationFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match  '\.js|\.html|\.css'

     If ( -Not $ContainsApplicationFiles) {
      #lanzamos una excepción
       Throw "Not a web app"
     } Else {
       Write-Host "Source files look good, continuing"
     }
   } Catch {
    Throw "No backup created due to: $($_.Exception.Message)"
   }
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