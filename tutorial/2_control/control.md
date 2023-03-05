## ForEach

Obtiene el primer elemento del subdirectorio, y muestra todas sus propiedades y métodos:

```ps
Get-ChildItem .\picoGPT\ -Recurse | Select-Object -First 1|Get-Member
```

Podemos listar un par de propiedades:

```ps
Get-ChildItem .\picoGPT\ -Recurse |Select-Object BaseName,Extension
```

Veamos el loop `ForEach-Object`. Observese como usamos el switch `Parallel` para que la ejecución se haga en __paralelo__:

```ps
Get-ChildItem .\picoGPT\ -Recurse | ForEach-Object -Parallel { write-host "archivo $($_.BaseName)" }
```

## For

```ps
For($i=1; $i -le 10; $i++) {
   Write-Host "Creating User $i"
}
```

## Do-While, Do Until y While

```ps
Do {
   Write-Host "Script block to process"
} While ($answer -eq "go")
```

```ps
Do {
   Write-Host "Script block to process"
} Until ($answer -eq "stop")
```

```ps
While ($answer -eq "go") {
   Write-Host "Script block to process"
}
```

## If Then Else

```ps
If ($freeSpace -le 5GB) {
   Write-Host "Free disk space is less than 5 GB"
} ElseIf ($freeSpace -le 10GB) {
   Write-Host "Free disk space is less than 10 GB"
} Else {
   Write-Host "Free disk space is more than 10 GB"
}
```

## Switch Case

```py
Switch ($choice) {
   1 { Write-Host "You selected menu item 1" }
   2 { Write-Host "You selected menu item 2" }
   3 { Write-Host "You selected menu item 3" }
   Default { Write-Host "You did not select a valid option" }
}
```

podemos usar regular expressions si usamos el parámetro `-wildcard`:

```ps
Switch -WildCard ($ip) {
   "10.*" { Write-Host "This computer is on the internal network" }
   "10.1.*" { Write-Host "This computer is in London" }
   "10.2.*" { Write-Host "This computer is in Vancouver" }
   Default { Write-Host "This computer is not on the internal network" }
 }
```

