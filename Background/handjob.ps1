﻿# Window title
$esc = [char]27
"$esc]0;Auto HANDJOB Upload v0.2$esc]0;"

# LOADING MAIN VARIABLES

# Main folders 
$MainFolder = (Get-Item $PSScriptRoot).Parent.FullName
$BackgroundFolder = $PSScriptRoot
$OutputHandjobFolder = $MainFolder+'\OutputHandjob'
$ScreensCompFolder = $MainFolder+'\ScreensComp'

# Background Folders
$ExecutablesFolder = $BackgroundFolder+'\Executables'
$FunctionsFolder = $BackgroundFolder+'\Functions'
$SendToFolder = $BackgroundFolder+'\SendTo'
$TemplatesFolder = $BackgroundFolder+'\Templates'

# Variables of executables
$curl = $ExecutablesFolder+'\curl\bin\curl.exe'
$mediainfo = $ExecutablesFolder+'\mediainfo\MediaInfo.exe'
$ffmpeg = $ExecutablesFolder+'\ffmpeg.exe'

# Tests whether the system is 32 or 64 bits choose the version of mktorrent
if ([System.IntPtr]::Size -eq 4){
  $mktorrent = $ExecutablesFolder+'\mktorrent-1.1-win-32bit-build1\mktorrent.exe'}
else { 
  $mktorrent = $ExecutablesFolder+'\mktorrent-1.1-win-64bit-build1\mktorrent.exe'
}

# Load variables from the configuration file
. $FunctionsFolder'\Config.ps1'

# Ensures that the HANDJOB folder ends with a \
if ($folderHandjob -notmatch '$\\')
{
  $folderHandjob += '\'
}

# Templates
$templateStandard = $TemplatesFolder+'\'+$regular_Template
$templateComps = $TemplatesFolder+'\'+$screencomp_Template

# FolderHandjob mktorent format
$NewfolderHandjob = $folderHandjob -replace ":\\", "/"
$folderHandjobb = $NewfolderHandjob -replace "\\", "/"
$folderHandjobMK = "/cygdrive/$($folderHandjobb)"

# OutputHandjob mktorrent format
$TempMainFolder = $MainFolder -replace ":\\", "/"
$TempMainFolder2 = $TempMainFolder -replace "\\", "/"
$BaseDirectoryMK = "/cygdrive/$($TempMainFolder2)/"
$OutputHandjobMK = "$($BaseDirectoryMK)OutputHandjob/"

# Loading file with auxiliary functions
. $FunctionsFolder'\Auxiliary.ps1'

# Loading 'Menu' function file
. $FunctionsFolder'\Menu.ps1'

# -- STARTING  THE SCRIPT INTERFACE -- 

Debug -TypeError "config"

$FileName = $args[0]
$Source = $args[1]

if ($FileName -eq $null) {
  while ($xMenu -ne 4) {
    $FileName = $null
    Banner "CHOOSE AN OPTION"
    $xMenu = menu -ReturnIndex @("Start a new HANDJOB upload", "Clear output folder", "Change Settings", "Enable the 'Sendo to' feature", "Quit") 
    switch ($xMenu) {
      0 { 
          if ((Get-ChildItem -Path $folderHandjob -force | Where-Object Extension -in ('.mkv') | Measure-Object).Count -eq  0) {
            Write-Host " There are no * .MKV files in the path configured as a HANDJOB folder. " -ForegroundColor red
            Write-Host " Open the settings and change the path to the HANDJOB folder" -ForegroundColor red
            Write-Host " or place * .MKV files in the folder." -ForegroundColor red
            Write-Host ""
            Write-Host -NoNewLine ' Press any key to continue...';
            $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          }else {
              Banner "CHOOSE A FILE (LAST 12)"
              $FileName = Menu @(Get-ChildItem -Path "$($folderHandjob)*.mkv" -Recurse | Sort-Object -Descending -Property LastWriteTime | Select -expand Name -First 12)  
              $FileNameMod = $FileName.TrimEnd(".mkv")
              do {
                Banner "THE ENCODE SOURCE"
                $Source = Read-Host " Type / Paste PL link or release name"
              }While ((!$Source))
              Banner "RUNNING SCRIPT"
              CreateFolder
              GenerateMediainfo
              TakeRegularScreens
              switch ($ImageServer) {
                ptpimg { PtpImage }
                pixhost { PixHost }
                catbox { CatBox }
              }
              MakeTorrent
              FinalTemplate
              RemoveItens
              Write-Host  " Press any key to continue..."
              $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');    
            }

        }
      
      1 {
          ClearOutupt
        }
  
      2 {
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
      
      3 {
          Debug -TypeError "sendto"
        }
      4 {
          (Get-Host).SetShouldExit(0)
        }
      Default {}
    }
  }
}
else {
  Debug -TypeError "filename"
  $FileNameMod = $FileName.TrimEnd(".mkv")
  if ((!$Source)) {
    do {
      Banner "THE ENCODE SOURCE"
      $Source = Read-Host " Source (Type / Paste PL link or release name)"
    }While ((!$Source)) 
  }
  Banner "RUNNING SCRIPT"
  CreateFolder
  GenerateMediainfo
  TakeRegularScreens
  switch ($ImageServer) {
    ptpimg { PtpImage }
    pixhost { PixHost }
    catbox { CatBox }
  }
  MakeTorrent
  FinalTemplate
  RemoveItens
}