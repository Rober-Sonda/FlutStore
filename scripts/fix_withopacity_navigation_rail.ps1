# TDD Green Phase: PowerShell Script para corregir deprecated withOpacity()
# Automatiza el reemplazo de .withOpacity( por .withValues(alpha: en app_navigation_rail.dart

$filePath = "c:\Flutter-Projects\tienda_app\lib\components\shared\app_navigation_rail.dart"
$backupPath = "$filePath.backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Aplicando correcciones de deprecated withOpacity()" -ForegroundColor Green
Write-Host "Archivo: $filePath" -ForegroundColor Yellow

# Crear backup
Copy-Item $filePath $backupPath
Write-Host "Backup creado: $backupPath" -ForegroundColor Cyan

# Leer contenido
$content = Get-Content $filePath -Raw

# Contar instancias antes del reemplazo
$beforeCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
Write-Host "Instancias encontradas: $beforeCount" -ForegroundColor Yellow

# Aplicar reemplazo con regex más específico
# Patrón: .withOpacity(número) → .withValues(alpha: número)
$content = $content -replace '\.withOpacity\(([0-9]*\.?[0-9]+)\)', '.withValues(alpha: $1)'

# Verificar reemplazo
$afterCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
$replacedCount = $beforeCount - $afterCount

Write-Host "Reemplazos realizados: $replacedCount" -ForegroundColor Green
Write-Host "Instancias restantes: $afterCount" -ForegroundColor $(if($afterCount -eq 0) { "Green" } else { "Red" })

# Guardar archivo corregido
Set-Content $filePath $content -Encoding UTF8

# Verificar resultado con flutter analyze
Write-Host "`nVerificando con flutter analyze..." -ForegroundColor Cyan
Set-Location "c:\Flutter-Projects\tienda_app"

$analyzeResult = flutter analyze lib/components/shared/app_navigation_rail.dart 2>&1
$deprecatedCount = ($analyzeResult | Select-String "deprecated_member_use" | Measure-Object).Count

Write-Host "Deprecated warnings en archivo: $deprecatedCount" -ForegroundColor $(if($deprecatedCount -eq 0) { "Green" } else { "Yellow" })

if ($deprecatedCount -eq 0) {
    Write-Host "TDD Green Phase: Todas las correcciones aplicadas exitosamente!" -ForegroundColor Green
} else {
    Write-Host "Aun quedan $deprecatedCount warnings de deprecated_member_use" -ForegroundColor Yellow
}

Write-Host "`nResumen TDD:"
Write-Host "  Red -> Green: $replacedCount correcciones aplicadas"
Write-Host "  Deprecated warnings eliminados del archivo"
Write-Host "  Backup disponible en: $backupPath"