# TDD Green Phase: Script final masivo para withOpacity en views restantes
$projectPath = "c:\Flutter-Projects\tienda_app\lib\views"
$backupDir = "c:\Flutter-Projects\tienda_app\backups\views_final_withopacity_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrigiendo withOpacity restante en views" -ForegroundColor Green

# Crear directorio backup
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
Write-Host "Directorio backup: $backupDir" -ForegroundColor Cyan

# Buscar todos los archivos .dart en views
$dartFiles = Get-ChildItem -Path $projectPath -Filter "*.dart" -Recurse

$totalFixed = 0
$totalFiles = 0

foreach ($file in $dartFiles) {
    $content = Get-Content $file.FullName -Raw
    $beforeCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
    
    if ($beforeCount -gt 0) {
        Write-Host "Procesando: $($file.Name)" -ForegroundColor Cyan
        
        # Crear backup
        $backupFile = Join-Path $backupDir $file.Name
        Copy-Item $file.FullName $backupFile
        
        # Aplicar reemplazo
        $content = $content -replace '\.withOpacity\(([0-9]*\.?[0-9]+)\)', '.withValues(alpha: $1)'
        
        $afterCount = ([regex]::Matches($content, "\.withOpacity\(")).Count
        $fixedInFile = $beforeCount - $afterCount
        
        if ($fixedInFile -gt 0) {
            Set-Content $file.FullName $content -Encoding UTF8
            Write-Host "  Corregidas: $fixedInFile instancias" -ForegroundColor Green
            $totalFixed += $fixedInFile
            $totalFiles++
        }
    }
}

Write-Host "`nResumen final:" -ForegroundColor Green
Write-Host "  Archivos procesados: $totalFiles"
Write-Host "  Total withOpacity corregidos: $totalFixed"
Write-Host "  Backup en: $backupDir"

# Verificación final global
Set-Location "c:\Flutter-Projects\tienda_app"
$finalWithOpacity = (flutter analyze lib/views/ 2>&1 | Select-String "withOpacity.*deprecated" | Measure-Object).Count
Write-Host "`nwithOpacity warnings restantes en views: $finalWithOpacity" -ForegroundColor $(if($finalWithOpacity -eq 0) { "Green" } else { "Yellow" })

if ($finalWithOpacity -eq 0) {
    Write-Host "TDD Green: TODOS los withOpacity en views corregidos!" -ForegroundColor Green
}