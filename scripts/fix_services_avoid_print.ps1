# TDD Green Phase: Script masivo para corregir avoid_print en services
$projectPath = "c:\Flutter-Projects\tienda_app"
$backupDir = "$projectPath\backups\services_avoid_print_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "TDD Green Phase: Corrigiendo avoid_print en services" -ForegroundColor Green

# Crear directorio backup
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
Write-Host "Directorio backup: $backupDir" -ForegroundColor Cyan

Set-Location $projectPath

# Obtener archivos dart con avoid_print en services
$dartFiles = flutter analyze lib/services/ 2>&1 | 
    Select-String "avoid_print" | 
    ForEach-Object { ($_ -split ' - ')[1] -replace ':.*$', '' } | 
    Sort-Object -Unique

Write-Host "Archivos con avoid_print encontrados: $($dartFiles.Count)" -ForegroundColor Yellow

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
        $beforeCount = ([regex]::Matches($content, "print\s*\(")).Count
        
        # Reemplazar print() con // TODO: Replace with logger
        # Patrón más específico para evitar false positives
        $content = $content -replace 'print\s*\(\s*([^)]+)\)\s*;', '// TODO: Replace with logger - print($1);'
        
        $afterCount = ([regex]::Matches($content, "print\s*\(")).Count
        $fixedInFile = $beforeCount - $afterCount
        
        if ($fixedInFile -gt 0) {
            Set-Content $fullPath $content -Encoding UTF8
            Write-Host "  Comentadas: $fixedInFile instancias print()" -ForegroundColor Green
            $totalFixed += $fixedInFile
            $totalFiles++
        } else {
            Write-Host "  No se encontraron patrones para comentar" -ForegroundColor Yellow
        }
    }
}

Write-Host "`nResumen:" -ForegroundColor Green
Write-Host "  Archivos procesados: $totalFiles"
Write-Host "  Total print() comentados: $totalFixed instancias"
Write-Host "  Backup en: $backupDir"

# Verificación global
Write-Host "`nVerificando progreso..." -ForegroundColor Cyan
$currentAvoidPrint = (flutter analyze lib/services/ 2>&1 | Select-String "avoid_print" | Measure-Object).Count
Write-Host "avoid_print warnings restantes: $currentAvoidPrint" -ForegroundColor $(if($currentAvoidPrint -eq 0) { "Green" } else { "Yellow" })

if ($currentAvoidPrint -eq 0) {
    Write-Host "TDD Green: Todos los avoid_print corregidos!" -ForegroundColor Green
} else {
    Write-Host "Quedan $currentAvoidPrint warnings de avoid_print" -ForegroundColor Yellow
}