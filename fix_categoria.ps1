# Script para corregir las expresiones null-aware innecesarias
$filePath = "lib\views\finanzas\cash_flow_view.dart"
$content = Get-Content $filePath -Raw -Encoding UTF8

# Reemplazar la expresión problemática
$pattern = [regex]::Escape("flujo.categoria ?? 'Sin categoría'")
$replacement = "flujo.categoria"

$newContent = $content -replace $pattern, $replacement

# Escribir el contenido corregido
Set-Content $filePath -Value $newContent -Encoding UTF8

Write-Host "Archivo corregido exitosamente"