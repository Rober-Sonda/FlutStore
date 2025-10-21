# TDD Green Phase: Script para corregir invalid @ignore annotations en custom_theme.dart
$filePath = "c:\Flutter-Projects\tienda_app\lib\models\custom_theme.dart"
$backupPath = "$filePath.backup_annotations_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrigiendo invalid @ignore annotations" -ForegroundColor Green

# Crear backup
Copy-Item $filePath $backupPath
Write-Host "Backup creado: $backupPath" -ForegroundColor Cyan

# Leer contenido
$content = Get-Content $filePath -Raw

# Contar anotaciones @ignore antes
$beforeCount = ([regex]::Matches($content, "@ignore")).Count
Write-Host "Anotaciones @ignore encontradas: $beforeCount" -ForegroundColor Yellow

# Eliminar @ignore de setters (líneas antes de 'set ')
$content = $content -replace '\s*@ignore\s*\n\s*set\s', "`n  set "

# Eliminar @ignore de métodos específicos (toAppTheme y updateTheme)
$content = $content -replace '\s*@ignore\s*\n\s*(AppTheme toAppTheme|void updateTheme)', "`n  `$1"

# Verificar resultado
$afterCount = ([regex]::Matches($content, "@ignore")).Count
$fixedCount = $beforeCount - $afterCount

Write-Host "Anotaciones eliminadas: $fixedCount" -ForegroundColor Green
Write-Host "Anotaciones restantes: $afterCount" -ForegroundColor $(if($afterCount -le 11) { "Green" } else { "Yellow" })

# Guardar archivo
Set-Content $filePath $content -Encoding UTF8

# Verificar con flutter analyze
Set-Location "c:\Flutter-Projects\tienda_app"
$analyzeResult = flutter analyze lib/models/custom_theme.dart 2>&1
$invalidAnnotations = ($analyzeResult | Select-String "invalid_annotation_target" | Measure-Object).Count

Write-Host "Invalid annotation warnings: $invalidAnnotations" -ForegroundColor $(if($invalidAnnotations -eq 0) { "Green" } else { "Yellow" })

if ($invalidAnnotations -eq 0) {
    Write-Host "TDD Green: custom_theme.dart annotations completamente corregidas!" -ForegroundColor Green
} else {
    Write-Host "Aun quedan $invalidAnnotations invalid annotations" -ForegroundColor Yellow
}