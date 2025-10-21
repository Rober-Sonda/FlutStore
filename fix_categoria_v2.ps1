# Script mejorado para corregir las expresiones null-aware innecesarias
$filePath = "lib\views\finanzas\cash_flow_view.dart"

# Leer línea por línea para evitar problemas de encoding
$lines = Get-Content $filePath -Encoding UTF8

# Procesar cada línea
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match "flujo\.categoria \?\? 'Sin categoría'") {
        $lines[$i] = $lines[$i] -replace "flujo\.categoria \?\? 'Sin categoría'", "flujo.categoria"
        Write-Host "Línea $($i+1) corregida: $($lines[$i].Trim())"
    }
}

# Escribir el archivo corregido
$lines | Set-Content $filePath -Encoding UTF8

Write-Host "Proceso completado"