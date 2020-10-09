@echo off
Powershell.exe -executionpolicy remotesigned -File "C:\Tools\AHU\AHU.ps1" "%~n1.mkv"

