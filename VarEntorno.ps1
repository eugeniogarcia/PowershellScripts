#Configura las variables de entorno para configurar el ingress Gateway
Get-ChildItem Env:

$Env:INGRESS_PORT = kubectl -n istio-system get service istio-ingressgateway -o jsonpath="{.spec.ports[?(@.name=='http2')].nodePort}"
Get-ChildItem  Env:Nombre

$Env:Nombre="Eugenio"

Get-ChildItem  Env:Nombre

$Env:Nombre+=" Garcia San Martin"

Get-ChildItem  Env:Nombre

Remove-Item Env:Nombre