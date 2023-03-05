[Powershell Gallery](https://www.powershellgallery.com/)

## Show-command

```ps
Show-Command Invoke-RestMethod
```

## Ayuda

```ps
Get-Help -Name Get-Help

Get-Help Get-FileHash -Examples
```

buscar comandos que este relacionados con un determinado tipo:

```ps
Get-Process -Name 'name-of-process' | Get-Member

Get-Command -ParameterType Process
```

## Seleccionar objetos y propiedades:

```ps
Get-Process zsh | Get-Member -Name C*

Get-Process zsh | Select-Object -Property Id, Name, CPU

Get-Process | Sort-Object -Descending -Property Name, CPU
```


```ps
(Get-ChildItem $Path).Extension | Sort-Object -Unique
```

## Pipeline 

un pipeline combinando varios comandos:

```ps
Get-Process | Where-Object CPU -gt 2 | Sort-Object CPU -Descending | Select-Object -First 3
```

## Formateo

```ps
"a string" | Get-Member | Format-List
```

```ps
"a string" | Get-Member | Format-Table
```

## Alias

Recuperar aliases que tenemos definidos:

```ps
Get-Alias

Get-Alias era*
```

Podemos hacer la búsqueda al reves, obtener que aliases un determinado cmdlet tiene definidos. Por ejemplo, con `Remove-Item` tenemos los siguientes alias:

```ps
Get-Alias -definition Remove-Item
```

Podemos crear nuevos alias con `New-Alias`, pero solo estarán disponibles en la sesión

## Firmar un script

```ps
$cert =  Get-ChildItem -Path "Cert:\CurrentUser\My" -CodeSigningCert
Set-AuthenticodeSignature -FilePath "C:\Scripts\MyScript.ps1" -Certificate $cert
```
