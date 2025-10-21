# TDD Green Phase: Script para corregir deprecated .value en custom_theme.dart
$filePath = "c:\Flutter-Projects\tienda_app\lib\models\custom_theme.dart"
$backupPath = "$filePath.backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrigiendo deprecated .value en custom_theme.dart" -ForegroundColor Green

# Crear backup
Copy-Item $filePath $backupPath
Write-Host "Backup creado: $backupPath" -ForegroundColor Cyan

# Leer contenido
$content = Get-Content $filePath -Raw

# Contar instancias antes
$beforeCount = ([regex]::Matches($content, "\.value")).Count
Write-Host "Instancias .value encontradas: $beforeCount" -ForegroundColor Yellow

# Aplicar reemplazos específicos para color.value
# Patrón: color.value → color.toARGB32()
$content = $content -replace '(\w+)\.value;', '$1.toARGB32();'

# Verificar resultado
$afterCount = ([regex]::Matches($content, "\.value")).Count
$fixedCount = $beforeCount - $afterCount

Write-Host "Instancias corregidas: $fixedCount" -ForegroundColor Green
Write-Host "Instancias restantes: $afterCount" -ForegroundColor $(if($afterCount -eq 0) { "Green" } else { "Yellow" })

# Guardar archivo
Set-Content $filePath $content -Encoding UTF8

# Verificar con flutter analyze
Set-Location "c:\Flutter-Projects\tienda_app"
$analyzeResult = flutter analyze lib/models/custom_theme.dart 2>&1
$deprecatedInFile = ($analyzeResult | Select-String "deprecated_member_use" | Measure-Object).Count

Write-Host "Deprecated warnings en archivo: $deprecatedInFile" -ForegroundColor $(if($deprecatedInFile -eq 0) { "Green" } else { "Yellow" })

if ($deprecatedInFile -eq 0) {
    Write-Host "TDD Green: custom_theme.dart completamente corregido!" -ForegroundColor Green
}