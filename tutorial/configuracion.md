Powershell esta instalado en:

```ps
$PSHome
```

Los módulos se cargan automáticamente en powershell. Los módulos se buscan en la ruta:

```ps
$env:PSModulePath
```

Los modulos disponibles:

```ps
Get-Module
```

Los cmdlets disponibles en un determinado módulo:

```ps
Get-Command –Module xxxxx
```

El perfil esta disponible en `$profile`.