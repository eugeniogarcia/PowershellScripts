## parametros obligatorios

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

## valores por defecto

Podemos dar valores por defecto:

```ps
Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)
```

## switch

Switches son un caso especial. Se trata de parámetros que aceptan un valor booleano, pero con la particularidad de que el valor es marcado como true solo cuando el switch es incluido en la línea de comandos. Por ejemplo `-Recurse`:

```ps
Get-ChildItem c:\ -Recurse
```

```ps
Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
  [switch]$PathIsWebApp
)
```