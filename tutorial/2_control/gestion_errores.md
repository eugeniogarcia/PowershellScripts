## try-catch:

```ps
Try {
   # Do something with a file.
} Catch [System.IO.IOException] {
   Write-Host "Something went wrong"
}  Catch {
   # Catch all. It's not an IOException but something else.
}
```

Podemos usar finally:

```ps
Try {
   # Do something with a file.
} Catch [System.IO.IOException] {
   Write-Host "Something went wrong"
}  Catch {
   # Catch all. It's not an IOException but something else.
} Finally {
   # Clean up resources.
}
```

Podemos acceder a los datos de la excepción con a través de la variable `$_`, y más concreatamente usando la propiedad `$_.exception`:

```ps
Try {
     # Do something with a file.
   } Catch [System.IO.IOException] {
     Write-Host "Something IO went wrong: $($_.exception.message)"
   }  Catch {
     Write-Host "Something else went wrong: $($_.exception.message)"
   }
```

## Generar errores

Cuando utilicemos el cmdlet `Write-Error` se genera un error que no interrumpe la ejecución. Cuando rodeamos `Write-Error` con un _try-catch_, el _try-catch_ no se dispara. Si queremos forzar que el cmdlet cuando detecte un error interrumpa la ejecución del script, tenemos que usar el parametro `ErrorAction`:

```ps
Try {
   Get-Content './file.txt' -ErrorAction Stop
} Catch {
   Write-Error "File can't be found"
}
```

al indicar `-ErrorAction Stop` estamos forzando a que se lance una excepción cuando el cmdlet detecte un error. 

Cuando queremos, según nuestra lógica de negocio, lanzar una axcepción:

```ps
Try {
   If ($Path -eq './forbidden') 
   {
     Throw "Path not allowed"
   }
   # Carry on.

} Catch {
   Write-Error "$($_.exception.message)" # Path not allowed.
}
```

