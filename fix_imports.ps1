# Script para corregir imports duplicados y conflictos de tipos
$projectRoot = Get-Location

# Buscar archivos que usan package:tienda_app/ 
$packageImports = Get-ChildItem -Path "lib" -Recurse -Name "*.dart" | ForEach-Object {
    $filePath = "lib\$_"
    $content = Get-Content $filePath -Raw
    if ($content -match 'package:tienda_app/') {
        Write-Host "Archivo con package imports: $filePath"
        # Reemplazar package:tienda_app/ con rutas relativas
        $relativePath = $filePath -replace '\\', '/'
        
        # Calcular la profundidad del directorio
        $depth = ($relativePath -split '/').Count - 2
        $prefix = "../" * $depth
        
        # Reemplazar imports de modelos
        $content = $content -replace 'package:tienda_app/models/', "$prefix`models/"
        $content = $content -replace 'package:tienda_app/services/', "$prefix`services/"
        $content = $content -replace 'package:tienda_app/providers/', "$prefix`providers/"
        $content = $content -replace 'package:tienda_app/widgets/', "$prefix`widgets/"
        $content = $content -replace 'package:tienda_app/views/', "$prefix`views/"
        $content = $content -replace 'package:tienda_app/src/', "$prefix`src/"
        
        Set-Content $filePath -Value $content -Encoding UTF8
        Write-Host "Corregido: $filePath"
    }
}

Write-Host "Proceso completado"