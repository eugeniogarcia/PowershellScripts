Forzamos con código a que el parametro se informe:

```ps
If (-Not $Path -eq '') {
   New-Item $Path
   Write-Host "File created at path $Path"
} Else {
   Write-Error "Path cannot be empty"
}
```

Hacemos lo mismo con una anotación:

```ps
Param(
   [Parameter(Mandatory)]
   $Path
)
```

En la anotación podemos indicar un mensaje de ayuda. También podemos indicar el tipo de los argumentos:

```ps
Param(
   [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
   [string]$Path
)
```

Podemos dar valores por defecto:

```ps
Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)
```