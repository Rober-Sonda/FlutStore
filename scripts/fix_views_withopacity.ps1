# TDD Green Phase: Script masivo para corregir withOpacity en todas las views
$projectPath = "c:\Flutter-Projects\tienda_app"
$backupDir = "$projectPath\backups\views_withopacity_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrección masiva de withOpacity en views" -ForegroundColor Green

# Crear directorio backup
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
Write-Host "Directorio backup: $backupDir" -ForegroundColor Cyan

Set-Location $projectPath

# Lista de archivos views con withOpacity (obtenida del análisis previo)
$targetFiles = @(
    'lib\views\productos_view.dart',
    'lib\views\sorteos\sweepstakes_view.dart', 
    'lib\views\roles\roles_view.dart',
    'lib\views\reportes\utilidad_report_view.dart',
    'lib\views\reportes\reports_view.dart',
    'lib\views\registros_financieros\financial_records_view.dart',
    'lib\views\productos\widgets\product_card.dart',
    'lib\views\finanzas\fixed_expenses_view.dart'
)

$totalFixed = 0
$totalFiles = 0

Write-Host "Archivos objetivo: $($targetFiles.Count)" -ForegroundColor Yellow

foreach ($relativePath in $targetFiles) {
    $fullPath = Join-Path $projectPath $relativePath
    if (Test-Path $fullPath) {
        Write-Host "`nProcesando: $relativePath" -ForegroundColor Cyan
        
        # Crear backup con nombre único
        $backupFileName = ($relativePath -replace '[\\\/]', '_')
        $backupPath = Join-Path $backupDir $backupFileName
        Copy-Item $fullPath $backupPath
        
        # Procesar archivo
        $content = Get-Content $fullPath -Raw
        $beforeCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
        
        if ($beforeCount -gt 0) {
            # Aplicar corrección
            $content = $content -replace '\.withOpacity\(([0-9]*\.?[0-9]+)\)', '.withValues(alpha: $1)'
            
            $afterCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
            $fixedInFile = $beforeCount - $afterCount
            
            # Guardar archivo corregido
            Set-Content $fullPath $content -Encoding UTF8
            
            Write-Host "  Corregidas: $fixedInFile instancias" -ForegroundColor Green
            $totalFixed += $fixedInFile
            $totalFiles++
        } else {
            Write-Host "  No se encontraron instancias" -ForegroundColor Gray
        }
    } else {
        Write-Host "  Archivo no encontrado: $relativePath" -ForegroundColor Red
    }
}

Write-Host "`nResumen:" -ForegroundColor Green
Write-Host "  Archivos procesados: $totalFiles"
Write-Host "  Total corregidas: $totalFixed instancias"
Write-Host "  Backup en: $backupDir"

# Verificación global de progreso
Write-Host "`nVerificando progreso global..." -ForegroundColor Cyan
$currentTotal = (flutter analyze 2>&1 | Select-String "withOpacity.*deprecated" | Measure-Object).Count
Write-Host "withOpacity warnings globales restantes: $currentTotal" -ForegroundColor $(if($currentTotal -lt 122) { "Green" } else { "Yellow" })

if ($totalFixed -gt 0) {
    Write-Host "TDD Green: Progreso exitoso aplicado a views!" -ForegroundColor Green
}