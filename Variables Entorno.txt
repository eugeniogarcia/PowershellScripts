Lista todas las variables:

```ps
Get-ChildItem Env: | Format-Table -Wrap -AutoSize
```

Buscar una variable de entorno con un patron:

```ps
Get-ChildItem Env: |Select-String -Pattern "^\w*:"
```

Podemos ver instrucciones tipo grep:

```ps
Select-String -Path C:\temp\*.log -Pattern "Contoso"

Get-ChildItem C:\temp -Filter *.log -Recurse | Select-String "Contoso"

If you have to copy all the files with a specific content, you can simply add a Copy-Item cmdlet.

Get-ChildItem C:\temp -Filter *.log -Recurse |&nbsp;Select-String "Contoso"&nbsp;| Copy-Item -Destination C:\temp2
```