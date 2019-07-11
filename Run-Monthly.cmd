@ECHO OFF
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -UseCustomIndexes -Force
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -DeleteDeclined -Force
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -CleanSources -Force
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -CleanSUGs -Force
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -RemoveEmptySUGs -Force
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -FirstRun -Force
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -RunCleanupWizard -Force
