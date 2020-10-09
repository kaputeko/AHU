function Banner {
  param (
    [Parameter()]
    [string]$Title)
Clear-Host
Write-Host
"
     _         _                        _         _   _    _    _   _ ____      _  ___  ____  
    / \  _   _| |_ ___  _ __ ___   __ _| |_ ___  | | | |  / \  | \ | |  _ \    | |/ _ \| __ ) 
   / _ \| | | | __/ _ \| '_ ` _  \ / _ ` | __/ _ \ | |_| | / _ \ |  \| | | | |_  | | | | |  _ \ 
  / ___ \ |_| | || (_) | | | | | | (_| | ||  __/ |  _  |/ ___ \| |\  | |_| | |_| | |_| | |_) |
 /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__\___| |_| |_/_/   \_\_| \_|____/ \___/ \___/|____/ 
  _   _       _                 _                                                             
 | | | |_ __ | | ___   __ _  __| |       
 | | | | '_ \| |/ _ \ / _`  |/ _ ` |     
 | |_| | |_) | | (_) | (_| | (_| |       
  \___/| .__/|_|\___/ \__,_|\__,_|                                                            
       |_| v0.2.2  (c)  Caput
 _____________________________________________________________________________________________
"
Write-Host " $Title "
Write-Host " _____________________________________________________________________________________________"
if(($FileName)){
  Write-Host " "`n" Target: " -nonewline
  Write-Host " " -NoNewline;Write-Host " $FileName " -ForegroundColor Black -BackgroundColor White
  Write-Host ""
}else {
  Write-Host "" -ForegroundColor White -BackgroundColor DarkCyan
}
}
function Debug {
  param (
    [Parameter(Mandatory)]
    [string]$TypeError)

    switch ($TypeError) {

      config { 
        # Tests if the variables $folderHandjob and  $announceURL has been defined
        if (!($folderHandjob) -And !($announceURL)){
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " You have not configured the " -nonewline -ForegroundColor red
          Write-Host " folderHandjob " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host " You have not configured the " -nonewline -ForegroundColor red
          Write-Host " announceURL " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        # Tests if the variable $folderHandjob has been defined
        elseif (!($folderHandjob)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " You have not configured the " -nonewline -ForegroundColor red
          Write-Host " folderHandjob " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }

        # Tests if the variable $folderHandjob has a valid path
        elseif (($folderHandjob) -And (Test-Path -path $folderHandjob) -eq $false) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " The path used in the " -nonewline -ForegroundColor red
          Write-Host " folderHandjob " -nonewline -BackgroundColor DarkRed
          Write-Host " variable does not exist!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
  
        # Tests whether you have defined a folder for output and if defined, test whether it exists.
        elseif (($customOutputFolder) -And (Test-Path -path $customOutputFolder) -eq $false) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " The path used in the " -nonewline -ForegroundColor red
          Write-Host " customOutputFolder " -nonewline -BackgroundColor DarkRed
          Write-Host " variable does not exist!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        
        # Tests if the variable $announceURL has been defined
        elseif (!($announceURL)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " You have not configured the " -nonewline -ForegroundColor red
          Write-Host " announceURL " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        # If the image server chosen is ptpimg, it tests whether the variable $api_key_ptpimg has been defined.
        elseif (($ImageServer -eq "ptpimg") -And !($api_key_ptpimg)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " You have not configured the " -nonewline -ForegroundColor red
          Write-Host " api_key_ptpimg " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        # Tests if the variable $ImageServer has been defined
        elseif (!($ImageServer)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline
          Write-Host "You have not configured the " -nonewline -ForegroundColor red
          Write-Host " ImageServer " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        elseif (!($regular_Template)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline
          Write-Host "You have not configured the " -nonewline -ForegroundColor red
          Write-Host " regular_Template " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        elseif (!($screencomp_Template)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline
          Write-Host "You have not configured the " -nonewline -ForegroundColor red
          Write-Host " screencomp_Template " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }
        elseif (!($deleteComps)) {
          Banner "CHECKING SCRIPT SETTINGS"
          Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline
          Write-Host "You have not configured the " -nonewline -ForegroundColor red
          Write-Host " deleteComps " -nonewline -BackgroundColor DarkRed
          Write-Host " variable!" -ForegroundColor red          
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          # Opens the settings file with notepad
          & notepad.exe "$($FunctionsFolder)\Config.ps1"
          Exit
        }                
      }

      filename{
        # Tests if the encode file is in the handjob folder.
        if ( "$($FileName)" -like "*.mkv" ) {
          if (!(Test-Path -path $folderHandjob$FileName)) {
            Banner "CHECKING THE FILE"
            Start-Sleep -Seconds 1.0
            Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline
            Write-Host "Point to a * .mkv file that exists inside the HANDJOB folder!" -ForegroundColor red            
            Write-Host ""
            Write-Host -NoNewLine ' Press any key to continue...';
            $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
            Exit
          }
        }
        # Tests whether it is a directory.
        elseif (!(Test-Path -path $folderHandjob$FileName)) {
          Banner "CHECKING THE FILE"
          Start-Sleep -Seconds 1.0
          Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline
          Write-Host "I only support * .MKV files inside the HANDJOB folder!" -ForegroundColor red         
          Write-Host ""
          Write-Host -NoNewLine ' Press any key to continue...';
          $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
          Exit
        }
      }
      
      sendto{ 
        if (Test-Path $SendToFolder'\automate-handjob.bat' -PathType Leaf) {
          Banner "INSTALLING FEATURE 'SEND TO'"
          Write-Host " The feature has already been installed! Do you want to reinstall it?" -ForegroundColor red
          Write-Host ""
          $resposta = menu -ReturnIndex @("No", "Yes") 
          if ($resposta -eq 1) {
            InstallSendTo
          }else {
            Break
          }
        }else {
          InstallSendTo  
        }
        
      }

    }
}

function CreateFolder {
  # Creates the folder where the final files will be deposited
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Creating the upload folder " -nonewline
  # If the folder exists, delete it!
  if (Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'){
    Remove-Item -LiteralPath $OutputHandjobFolder'\'$FileNameMod'\' -Force -Recurse
  }
  New-Item -Path $OutputHandjobFolder'\' -Name $FileNameMod'\' -ItemType Directory > $Null
  Start-Sleep -Seconds 0.3
  Write-Host "[ DONE ]" -ForegroundColor Green
}

function GenerateMediainfo {
  # Generates the mediainfo file of the movie already formatted with just the name
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Generating mediainfo " -nonewline
  & $mediainfo $folderHandjob$FileName >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo'
  Start-Sleep -Seconds 1.0
  $path = $folderHandjob -replace '\\', '\\'
  (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo') | Foreach-Object {$_ -replace "$path", ""} | Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo'
  
  if ((Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo') -And (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo'| Measure-Object -Line).Lines -gt 12) {
    Write-Host "[ DONE ]" -ForegroundColor Green  
  }else {
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Something went very wrong. Stopping the script!" -ForegroundColor Red
    Write-Host  " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit
  }
}

function TakeRegularScreens {
  # Take screens with ffmpeg
  # If you want to take more screens shots just add new lines with a shorter time interval.
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Creating the Screens " -nonewline
  & $ffmpeg -ss 00:10:00 -i $folderHandjob$FileName -y  -vframes 1 -vf "scale='max(sar,1)*iw':'max(1/sar,1)*ih'" $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.screen.01.png' > $null 2>&1
  & $ffmpeg -ss 00:20:00 -i $folderHandjob$FileName -y  -vframes 1 -vf "scale='max(sar,1)*iw':'max(1/sar,1)*ih'" $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.screen.02.png' > $null 2>&1
  & $ffmpeg -ss 00:30:00 -i $folderHandjob$FileName -y  -vframes 1 -vf "scale='max(sar,1)*iw':'max(1/sar,1)*ih'" $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.screen.03.png' > $null 2>&1
  & $ffmpeg -ss 00:40:00 -i $folderHandjob$FileName -y  -vframes 1 -vf "scale='max(sar,1)*iw':'max(1/sar,1)*ih'" $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.screen.04.png' > $null 2>&1
  
  if ((Get-ChildItem -Path $OutputHandjobFolder'\'$FileNameMod'\' -force | Where-Object Extension -in ('.png') | Measure-Object).Count -ge  4) {
    Write-Host "[ DONE ]" -ForegroundColor Green  
  }else {
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Something went very wrong. Stopping the script!" -ForegroundColor Red
    Write-Host  " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit
  }
}

function PtpImage {
  # Checks for images in the 'Screens Comp' folder
  $imagesComp = (Get-ChildItem -Path $ScreensCompFolder'\' -force | Where-Object Extension -in ('.png') | Measure-Object).Count
  
  # Uploading comprarison screens to ptpimg
  # If the number of images is not an even number ...
  If (($imagesComp % 2))  {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Wrong number of images to use in BBCode 'comparison'. [ WARNING ]" -ForegroundColor yellow
    Start-Sleep -Seconds 1.0
  }
  
  # If the number of images is an even number and is not 0
  If ($imagesComp -ne 0 -And (0 -eq $imagesComp % 2)) {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Detected comparison screens. [ ATTENTION ]" -ForegroundColor yellow
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Uploading the Comparison Screens in PTPIMG " -nonewline
    $screens = Get-ChildItem "$($ScreensCompFolder)\*.png"
    
    # Upload all * .img files into the folder.
    foreach ($screen in $screens) {
      & $curl -s -F file-upload[0]=@$screen -F api_key=$api_key_ptpimg "https://ptpimg.me/upload.php" | findstr "code" >> $OutputHandjobFolder'\'$FilenameMod'\'$FilenameMod'.comps'
    }
    
    # Formats the curl output
    (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps') | 
    Foreach-Object {$_ -replace '        "code": "', "https://ptpimg.me/"} | 
    Foreach-Object {$_ -replace '",', ".png"} | 
    Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'

    #Tests if the comp file contains less than 2 lines.
    if ((Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'| Measure-Object -Line).Lines -lt 2) {
      Write-Host "[ ERROR ]" -ForegroundColor Red
      Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
      Write-Host "At least one Comparison Screen has not been sent. " -ForegroundColor Red
    }else {
      Write-Host "[ DONE ]" -ForegroundColor Green
    }
  }

  # Uploading regular screens to ptpimg
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Uploading the Regular Screens in PTPIMG " -nonewline
  $screens = Get-ChildItem "$($OutputHandjobFolder)\$($FileNameMod)\*.png"
  foreach ($screen in $screens) {
    & $curl -s -F file-upload[0]=@$screen -F api_key=$api_key_ptpimg "https://ptpimg.me/upload.php" | findstr "code" >> $OutputHandjobFolder'\'$FilenameMod'\'$FilenameMod'.ptpimg'
  }
  (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg') | 
  Foreach-Object {$_ -replace '        "code": "', "[img]https://ptpimg.me/"} | 
  Foreach-Object {$_ -replace '",', ".png[/img]"} | 
  Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  #Tests if the comp file contains less than 2 lines.
  if ((Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'| Measure-Object -Line).Lines -lt 4) {
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "At least one Regular Screen has not been sent. " -ForegroundColor Red
  }else {
    Write-Host "[ DONE ]" -ForegroundColor Green
  }
}

function PixHost {
  # Uploading comprarison screens to pixhost
  $imagesComp = (Get-ChildItem -Path $ScreensCompFolder'\' -force | Where-Object Extension -in ('.png') | Measure-Object).Count
  If (($imagesComp % 2))  {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Wrong number of images to use in BBCode 'comparison'. [ WARNING ]" -ForegroundColor yellow
    Start-Sleep -Seconds 1.0
  }
  If ($imagesComp -ne 0 -And (0 -eq $imagesComp % 2)) {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Detected comparison screens. [ ATTENTION ]" -ForegroundColor yellow
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Uploading the Comparison Screens in PixHost.to " -nonewline
    $screens = Get-ChildItem "$($ScreensCompFolder)\*.png"
    foreach ($screen in $screens) {
      & $curl -s --ssl-no-revoke -X POST --include "https://api.pixhost.to/images" -H 'Content-Type: multipart/form-data; charset=utf-8' -H 'Accept: application/json' -F img=@$screen -F 'content_type=0' | findstr "show_url" >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'
    }
    
    (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps').Split(",") > $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps2'
    Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'
    (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps2') | findstr "show_url" >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'
    Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps2'

    (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps') | 
    Foreach-Object {$_ -replace '\\/', "/"} | 
    Foreach-Object {$_ -replace '"show_url":"', ""} | 
    Foreach-Object {$_ -replace '"', ""} | 
    Foreach-Object {$_ -replace 'pixhost.to/show/', "img46.pixhost.to/images/"} | 
    Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'
    
    #Tests if the comp file contains less than 2 lines.
    if ((Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'| Measure-Object -Line).Lines -lt 2) {
      Write-Host "[ ERROR ]" -ForegroundColor Red
      Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
      Write-Host "At least one Comparison Screen has not been sent. " -ForegroundColor Red
    }else {
      Write-Host "[ DONE ]" -ForegroundColor Green
    }
  }
  # Uploading regular screens to PixHost.to
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Uploading the Regular Screens in PixHost.to " -nonewline
  $screens = Get-ChildItem "$($OutputHandjobFolder)\$($FileNameMod)\*.png"
  foreach ($screen in $screens) {
    & $curl -s --ssl-no-revoke -X POST --include "https://api.pixhost.to/images" -H 'Content-Type: multipart/form-data; charset=utf-8' -H 'Accept: application/json' -F img=@$screen -F 'content_type=0' | findstr "show_url" >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  }

  (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg').Split(",") > $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg2'
  Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg2') | findstr "show_url" >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg2'

  (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg') | 
  Foreach-Object {$_ -replace '\\/', "/"} | 
  Foreach-Object {$_ -replace '"show_url":"', "[img]"} | 
  Foreach-Object {$_ -replace '"', "[/img]"} | 
  Foreach-Object {$_ -replace 'pixhost.to/show/', "img46.pixhost.to/images/"} | 
  Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  
  #Tests if the comp file contains less than 2 lines.
  if ((Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'| Measure-Object -Line).Lines -lt 4) {
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "At least one Regular Screen has not been sent. " -ForegroundColor Red
  }else {
    Write-Host "[ DONE ]" -ForegroundColor Green
  }
}

function CatBox {
  $imagesComp = (Get-ChildItem -Path $ScreensCompFolder'\' -force | Where-Object Extension -in ('.png') | Measure-Object).Count
  # Uploading comprarison screens to CatBox
  If (($imagesComp % 2))  {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Wrong number of images to use in BBCode 'comparison'. [ WARNING ]" -ForegroundColor yellow
    Start-Sleep -Seconds 1.0
  }

  If ($imagesComp -ne 0 -And (0 -eq $imagesComp % 2)) {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Detected comparison screens. [ ATTENTION ]" -ForegroundColor yellow
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Uploading the Comparison Screens in CatBox " -nonewline
    $screens = Get-ChildItem "$($ScreensCompFolder)\*.png"
    foreach ($screen in $screens) {
      & $curl -s -F "reqtype=fileupload" -F userhash=$user_hash_catbox -F fileToUpload=@$screen https://catbox.moe/user/api.php >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'
    }
  
    #Tests if the comp file contains less than 2 lines.
    if ((Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'| Measure-Object -Line).Lines -lt 2) {
      Write-Host "[ ERROR ]" -ForegroundColor Red
      Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
      Write-Host "At least one Comparison Screen has not been sent. " -ForegroundColor Red
    }else {
      Write-Host "[ DONE ]" -ForegroundColor Green
    }
  }

  # Uploading regular screens to the catbox
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Uploading the Regular Screens in CatBox " -nonewline
  $screens = Get-ChildItem "$($OutputHandjobFolder)\$($FileNameMod)\*.png"
  foreach ($screen in $screens) {
    & $curl -s -F "reqtype=fileupload" -F userhash=$user_hash_catbox -F fileToUpload=@$screen https://catbox.moe/user/api.php >> $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  }

  #Tests if the comp file contains less than 2 lines.
  if ((Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'| Measure-Object -Line).Lines -lt 4) {
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "At least one Regular Screen has not been sent. " -ForegroundColor Red
  }else {
    Write-Host "[ DONE ]" -ForegroundColor Green
  }
}

function MakeTorrent {
  # Create the torrent v3

  # If the file size is greater than or equal to 1 MB and less than 32 MB
  If((Get-Item $folderHandjob$FileName).length -ge 1048576 -And (Get-Item $folderHandjob$FileName).length -lt 33554432) {$sizeTorrent = 15}

  # If the file size is greater than or equal to 32 MB and less than 63 MB
  If((Get-Item $folderHandjob$FileName).length -ge 33554432 -And (Get-Item $folderHandjob$FileName).length -lt 66060288) {$sizeTorrent = 16}

  # If the file size is greater than or equal to 63 MB and less than 126 MB
  If((Get-Item $folderHandjob$FileName).length -ge 66060288 -And (Get-Item $folderHandjob$FileName).length -lt 132120576) {$sizeTorrent = 17}

  # If the file size is greater than or equal to 126 MB and less than 251 MB
  If((Get-Item $folderHandjob$FileName).length -ge 132120576 -And (Get-Item $folderHandjob$FileName).length -lt 263192576) {$sizeTorrent = 18}

  # If the file size is greater than or equal to 251 MB and less than 501 MB
  If((Get-Item $folderHandjob$FileName).length -ge 263192576 -And (Get-Item $folderHandjob$FileName).length -lt 525336576) {$sizeTorrent = 19}

  # If the file size is greater than or equal to 501 MB and less than 1 GB
  If((Get-Item $folderHandjob$FileName).length -ge 525336576 -And (Get-Item $folderHandjob$FileName).length -lt 1073741824) {$sizeTorrent = 20}

  # If the file size is greater than or equal to 1 GB and less than 2 GB
  If((Get-Item $folderHandjob$FileName).length -ge 1073741824 -And (Get-Item $folderHandjob$FileName).length -lt 2147483648) {$sizeTorrent = 21}

  # If the file size is greater than or equal to 2 GB and less than 4 GB
  If((Get-Item $folderHandjob$FileName).length -ge 2147483648 -And (Get-Item $folderHandjob$FileName).length -lt 4294967296) {$sizeTorrent = 22}

  # If the file size is greater than or equal to 4 GB and less than 8 GB
  If((Get-Item $folderHandjob$FileName).length -ge 4294967296 -And (Get-Item $folderHandjob$FileName).length -lt 8589934592) {$sizeTorrent = 23}

  # If the file size is greater than or equal to 8 GB
  If((Get-Item $folderHandjob$FileName).length -ge 8589934592) {$sizeTorrent = 24}

  # Creating the torrent
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Creating the Torrent " -nonewline
  & $mktorrent -v -s $sourceTorrent -l $sizeTorrent -p -a $announceURL -o $OutputHandjobMK$FileNameMod'/'$FileNameMod'.torrent' $folderHandjobMK$FileName > $null 2>&1
  
  if ((Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.torrent') -And (Get-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.torrent').length -gt 0 ) {
    Write-Host "[ DONE ]" -ForegroundColor Green
  }else {
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
    Write-Host "Something went very wrong. Stopping the script!" -ForegroundColor Red
    Write-Host  " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit
  }
}

function FinalTemplate {
  # Assembling final Tamplate
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Assembling the Final Template " -nonewline
  $mediainfo = Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo' -Raw
  $ptpimg = Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg' -Raw

  if (Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'){
    $comps = Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps' -Raw
    (Get-Content $templateComps -Raw) | 
    Foreach-Object {$_ -replace '<mediainfo>', "$mediainfo"} | 
    Foreach-Object {$_ -replace '<comps>', "$comps"} | 
    Foreach-Object {$_ -replace '<ptpimg>', "$ptpimg"} | 
    Foreach-Object {$_ -replace '<source>', "$source"} | 
    Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.template.txt' -Encoding UTF8
    Start-Sleep -Seconds 0.3
    Write-Host "[ DONE ]" -ForegroundColor Green
  }
  Else{
    (Get-Content $templateStandard -Raw) | 
    Foreach-Object {$_ -replace '<mediainfo>', "$mediainfo"} | 
    Foreach-Object {$_ -replace '<ptpimg>', "$ptpimg"} | 
    Foreach-Object {$_ -replace '<source>', "$source"} | 
    Set-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.template.txt' -Encoding UTF8
    Start-Sleep -Seconds 0.3
    Write-Host "[ DONE ]" -ForegroundColor Green
  }
}

function RemoveItens {
  # Removing items
  Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.mediainfo'
  if ((Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg') -And (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'| Measure-Object -Line).Lines -ge 4) {
    Remove-Item $OutputHandjobFolder'\'$FileNameMod'\*.png' 
  }
  If ((Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'))  {
    Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.ptpimg'
  }

  If ($deleteComps -eq "yes" -And (Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps') -And (Get-Content $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'| Measure-Object -Line).Lines -ge 2)  {
    Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - Clearing the contents of the 'Screens Comp' folder " -nonewline
    Remove-Item "$($ScreensCompFolder)\*.png"
    Write-Host "[ DONE ]" -ForegroundColor Green
    Start-Sleep -Seconds 0.3
  }
  If ((Test-Path -path $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'))  {
    Remove-Item $OutputHandjobFolder'\'$FileNameMod'\'$FileNameMod'.comps'
  }
  Write-Host " $(Get-Date -format 'dd-MM-yyyy HH:mm:ss') - " -nonewline 
  Write-Host "PROCESS COMPLETED " -ForegroundColor Green
  Write-Host " _____________________________________________________________________________________________"
  Write-Host ""
  Write-Host ""
  Write-Host " Press any key to continue..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}

function InstallSendTo {

  # Creating the bat file
  '@echo off' | Out-File -FilePath "$($SendToFolder)\automate-handjob.bat"
  'Powershell.exe -executionpolicy remotesigned -File '''+$MainFolder+'\AHU.ps1'' "%~n1.mkv"' | Out-File -FilePath "$($SendToFolder)\automate-handjob.bat" -Append
  (Get-Content "$($SendToFolder)\automate-handjob.bat" -Raw).Replace("'",'"')|
  Set-Content "$($SendToFolder)\automate-handjob.bat" -Encoding UTF8

  # Creating the bat shortcut
  $objShell = New-Object -ComObject WScript.Shell
  $lnk = $objShell.CreateShortcut("$home\AppData\Roaming\Microsoft\Windows\SendTo\Automate-Handjob.lnk")
  $lnk.TargetPath = "$($SendToFolder)\automate-handjob.bat"
  $lnk.IconLocation = "$($SendToFolder)\automate-handjob.ico"
  $lnk.Save()
  Banner "INSTALLING FEATURE 'SEND TO'"
  Start-Sleep -Seconds 1.0
  Write-Host " Right-click on any * .mkv file in the HANDJOB folder > 'Send to'." -ForegroundColor Green
  Write-Host " If everything went well, the 'Automate Handjob' option will be available." -ForegroundColor Green
  Write-Host ""
  Write-Host " Press any key to continue..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
}

function ClearOutupt {
  if (((Get-ChildItem $OutputHandjobFolder'\' | Measure-Object).Count) -ge 1 ) {
    Banner "CLEAN OUTPUT FOLDER"
    Write-Host " Are you sure you want to continue? This action is irreversible!" -ForegroundColor Red
    Write-Host ""
    $answer1 = menu -ReturnIndex @("Yes", "No")  
    if ($answer1 -eq 1) {
      Break
    }else {
      #Remove-Item -LiteralPath $OutputHandjobFolder'\*' -Force -Recurse
      Remove-Item $OutputHandjobFolder'\*' -Recurse -Force
      Banner "CLEAN OUTPUT FOLDER"
      Write-Host " Success in clearing the output folder!" -ForegroundColor Green
      Write-Host ""
      Write-Host " Press any key to continue..."
      $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
      Break
    }
  }else {
    Banner "CLEAN OUTPUT FOLDER"
    Write-Host " Your output folder has no files!" -ForegroundColor red
    Write-Host ""
    Write-Host " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Break
  }
}
function CreateShortcut {

  # Creating the bat shortcut
  # Main folders 
  $MainFolder_Install_Shortcut = $PSScriptRoot.TrimEnd("Background\Functions")
  $SendToFolder = $PSScriptRoot.TrimEnd("Functions")+"\SendTo"

  # Creating the ps1 shortcut Desktop
  $objShell = New-Object -ComObject WScript.Shell
  $lnk = $objShell.CreateShortcut("$($MainFolder_Install_Shortcut)\AHU.lnk")
  $lnk.TargetPath = "Powershell.exe"
  $lnk.Arguments = "-executionpolicy remotesigned -noexit -File $($MainFolder_Install_Shortcut)\AHU.ps1"
  $lnk.IconLocation = "$($SendToFolder)\automate-handjob.ico"
  $lnk.Save()
  Banner "INSTALLING SHORTCUT TO THE PROGRAM"
  # Creating the ps1 shortcut Desktop
  $objShell = New-Object -ComObject WScript.Shell
  $lnk = $objShell.CreateShortcut("$home\Desktop\AHU.lnk")
  $lnk.TargetPath = "Powershell.exe"
  $lnk.Arguments = "-executionpolicy remotesigned -noexit -File $($MainFolder_Install_Shortcut)\AHU.ps1"
  $lnk.IconLocation = "$($SendToFolder)\automate-handjob.ico"
  $lnk.Save()
  Start-Sleep -Seconds 0.5
  Write-Host " Shortcut successfully installed!" -ForegroundColor Green
  Write-Host ""
  Write-Host " Press any key to continue..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
  (Get-Host).SetShouldExit(0)
  }