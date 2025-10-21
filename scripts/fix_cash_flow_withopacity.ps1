# TDD Green Phase: Corrección específica para cash_flow_view.dart
$filePath = "c:\Flutter-Projects\tienda_app\lib\views\finanzas\cash_flow_view.dart"
$backupPath = "$filePath.backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrigiendo cash_flow_view.dart" -ForegroundColor Green

# Crear backup
Copy-Item $filePath $backupPath
Write-Host "Backup creado: $backupPath" -ForegroundColor Cyan

# Leer contenido
$content = Get-Content $filePath -Raw

# Contar instancias antes
$beforeCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
Write-Host "Instancias withOpacity encontradas: $beforeCount" -ForegroundColor Yellow

# Aplicar reemplazos específicos
$content = $content -replace '\.withOpacity\(([0-9]*\.?[0-9]+)\)', '.withValues(alpha: $1)'

# Verificar resultado
$afterCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
$fixedCount = $beforeCount - $afterCount

Write-Host "Instancias corregidas: $fixedCount" -ForegroundColor Green
Write-Host "Instancias restantes: $afterCount" -ForegroundColor $(if($afterCount -eq 0) { "Green" } else { "Yellow" })

# Guardar archivo
Set-Content $filePath $content -Encoding UTF8

# Verificar con flutter analyze
Set-Location "c:\Flutter-Projects\tienda_app"
$analyzeResult = flutter analyze lib/views/finanzas/cash_flow_view.dart 2>&1
$deprecatedInFile = ($analyzeResult | Select-String "deprecated_member_use" | Measure-Object).Count

Write-Host "Deprecated warnings en archivo: $deprecatedInFile" -ForegroundColor $(if($deprecatedInFile -eq 0) { "Green" } else { "Yellow" })

if ($deprecatedInFile -eq 0) {
    Write-Host "TDD Green: cash_flow_view.dart completamente corregido!" -ForegroundColor Green
}