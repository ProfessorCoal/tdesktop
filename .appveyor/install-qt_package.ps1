$vsixPath = "$($env:USERPROFILE)\QtPackage.vsix"
(New-Object Net.WebClient).DownloadFile('https://visualstudiogallery.msdn.microsoft.com/c89ff880-8509-47a4-a262-e4fa07168408/file/162291/22/QtPackage.vsix', $vsixPath)
"`"C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\VSIXInstaller.exe`" /q /a $vsixPath" | out-file ".\install-vsix.cmd" -Encoding ASCII
& .\install-vsix.cmd
