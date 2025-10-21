# TDD Green Phase: Script eficiente para comentar print statements
$projectPath = "c:\Flutter-Projects\tienda_app\lib\services"

Write-Host "TDD Green Phase: Comentando print statements en services" -ForegroundColor Green

# Buscar todos los archivos .dart en services
$dartFiles = Get-ChildItem -Path $projectPath -Filter "*.dart" -Recurse

$totalFixed = 0

foreach ($file in $dartFiles) {
    Write-Host "Procesando: $($file.Name)" -ForegroundColor Cyan
    
    # Leer contenido
    $content = Get-Content $file.FullName -Raw
    $beforeCount = ([regex]::Matches($content, "^\s*print\s*\(", [System.Text.RegularExpressions.RegexOptions]::Multiline)).Count
    
    if ($beforeCount -gt 0) {
        # Comentar líneas que empiecen con print(
        $lines = Get-Content $file.FullName
        $modifiedLines = @()
        
        foreach ($line in $lines) {
            if ($line -match "^\s*print\s*\(") {
                $modifiedLines += $line -replace "(\s*)print\s*\(", '$1// TODO: Replace with logger - print('
            } else {
                $modifiedLines += $line
            }
        }
        
        # Guardar archivo modificado
        $modifiedLines | Set-Content $file.FullName -Encoding UTF8
        
        $afterCount = ([regex]::Matches(($modifiedLines -join "`n"), "^\s*print\s*\(", [System.Text.RegularExpressions.RegexOptions]::Multiline)).Count
        $fixed = $beforeCount - $afterCount
        $totalFixed += $fixed
        
        Write-Host "  Comentadas $fixed líneas print()" -ForegroundColor Green
    }
}

Write-Host "`nTotal print statements comentados: $totalFixed" -ForegroundColor Green

# Verificar resultado
Set-Location "c:\Flutter-Projects\tienda_app"
$remaining = (flutter analyze lib/services/ 2>&1 | Select-String "avoid_print" | Measure-Object).Count
Write-Host "avoid_print warnings restantes: $remaining" -ForegroundColor $(if($remaining -eq 0) { "Green" } else { "Yellow" })