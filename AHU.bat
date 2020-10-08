@echo off & setlocal
set batchPath=%~dp0
IF "%1"=="" GOTO :Continue
Powershell.exe -executionpolicy remotesigned -noexit -File "%batchPath%\Background\handjob.ps1" %1 %2
:Continue
IF "%1"=="" Powershell.exe -executionpolicy remotesigned -noexit -File "%batchPath%\Background\handjob.ps1"