# TDD Green Phase: Script global para corregir ALL deprecated withOpacity() 
# Automatiza el reemplazo en todo el proyecto

$projectPath = "c:\Flutter-Projects\tienda_app"
$backupDir = "$projectPath\backups\withopacity_fixes_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrección global de deprecated withOpacity()" -ForegroundColor Green
Write-Host "Proyecto: $projectPath" -ForegroundColor Yellow

# Crear directorio de backup
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
Write-Host "Directorio backup: $backupDir" -ForegroundColor Cyan

# Obtener archivos dart con withOpacity
Set-Location $projectPath
$dartFiles = flutter analyze 2>&1 | Select-String "withOpacity.*deprecated" | 
             ForEach-Object { ($_ -split ' - ')[1] -replace ':.*$', '' } | 
             Sort-Object -Unique

Write-Host "Archivos con withOpacity encontrados: $($dartFiles.Count)" -ForegroundColor Yellow

$totalFixed = 0
$totalFiles = 0

foreach ($file in $dartFiles) {
    $fullPath = Join-Path $projectPath $file
    if (Test-Path $fullPath) {
        Write-Host "`nProcesando: $file" -ForegroundColor Cyan
        
        # Crear backup
        $backupFile = Join-Path $backupDir ($file -replace '[\\\/]', '_')
        Copy-Item $fullPath $backupFile
        
        # Leer y procesar contenido
        $content = Get-Content $fullPath -Raw
        $beforeCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
        
        # Aplicar reemplazo
        $content = $content -replace '\.withOpacity\(([0-9]*\.?[0-9]+)\)', '.withValues(alpha: $1)'
        
        $afterCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
        $fixedInFile = $beforeCount - $afterCount
        
        if ($fixedInFile -gt 0) {
            Set-Content $fullPath $content -Encoding UTF8
            Write-Host "  Fixed: $fixedInFile instancias" -ForegroundColor Green
            $totalFixed += $fixedInFile
            $totalFiles++
        } else {
            Write-Host "  No hay patrones simples para corregir" -ForegroundColor Yellow
        }
    }
}

Write-Host "`nResumen global:" -ForegroundColor Green
Write-Host "  Archivos procesados: $totalFiles"
Write-Host "  Correcciones aplicadas: $totalFixed"
Write-Host "  Backup en: $backupDir"

# Verificación final
Write-Host "`nVerificando resultado..." -ForegroundColor Cyan
$finalCount = (flutter analyze 2>&1 | Select-String "withOpacity.*deprecated" | Measure-Object).Count
Write-Host "withOpacity warnings restantes: $finalCount" -ForegroundColor $(if($finalCount -lt 122) { "Green" } else { "Yellow" })

if ($finalCount -lt 122) {
    $reduced = 122 - $finalCount
    Write-Host "Reducción exitosa: -$reduced warnings!" -ForegroundColor Green
}