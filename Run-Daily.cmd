@ECHO OFF
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Bypass -File "D:\Scripts\WSUSMaint\Invoke-DGASoftwareUpdateMaintenance.ps1" -DeclineSuperseded -DeclineByPlugins -Force
