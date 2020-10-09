# Main folders 
$MainFolder_Install_Shortcut = $PSScriptRoot.TrimEnd("Background\Functions")
$SendToFolder = $PSScriptRoot.TrimEnd("Functions")+"\SendTo"

. $PSScriptRoot'\Auxiliary.ps1'

# Creating the ps1 shortcut Desktop
$objShell = New-Object -ComObject WScript.Shell
$lnk = $objShell.CreateShortcut("$($MainFolder_Install_Shortcut)\AHU.lnk")
$lnk.TargetPath = "Powershell.exe"
$lnk.Arguments = "-executionpolicy remotesigned -noexit -File $($MainFolder_Install_Shortcut)\AHU.ps1"
$lnk.IconLocation = "$($SendToFolder)\automate-handjob.ico"
$lnk.Save()
Banner "INSTALLING SHORTCUT TO THE PROGRAM"
Start-Sleep -Seconds 0.5
Write-Host " Shortcut successfully installed!" -ForegroundColor Green
Write-Host ""
Write-Host " Press any key to continue..."

# Creating the ps1 shortcut Desktop
$objShell = New-Object -ComObject WScript.Shell
$lnk = $objShell.CreateShortcut("$home\Desktop\AHU.lnk")
$lnk.TargetPath = "Powershell.exe"
$lnk.Arguments = "-executionpolicy remotesigned -noexit -File $($MainFolder_Install_Shortcut)\AHU.ps1"
$lnk.IconLocation = "$($SendToFolder)\automate-handjob.ico"
$lnk.Save()
Banner "INSTALLING SHORTCUT TO THE PROGRAM"
Start-Sleep -Seconds 0.5
Write-Host " Shortcut successfully installed!" -ForegroundColor Green
Write-Host ""
Write-Host " Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
(Get-Host).SetShouldExit(0)

