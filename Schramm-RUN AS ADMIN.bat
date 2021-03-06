@echo off
set choice=n
if [%1]==[] (
	echo Would you like to shut down, restart, or log off after installation?
	set /p choice="(s = shutdown, r = choice, l = logoff, n = nothing): "
	goto start
)
if %1==/n set choice=n
if %1==/s set choice=s
if %1==/r set choice=r
if %1==/l set choice=l

:start
REM disables User Account Control
reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f >nul

if exist "C:\Program Files (x86)\Adobe\Acrobat Reader DC" (
	echo Adobe Acrobat Reader DC is already installed, skipping...
) else (
	echo Installing Adobe Acrobat Reader DC...
	msiexec /i "\\wcstech\Installs\Adobe\2018-19\Acrobat Reader DC\8-13-18\MSI\AcroRdrDC1801120055_en_US\AcroRead.msi" /qn
)

if exist "C:\Program Files (x86)\DRC INSIGHT Online Assessments" (
	echo DRC Insight is already installed, skipping...
) else (
	echo Installing DRC Insight...
	msiexec /i "\\wcstech\Installs\DRC Insight\drc_insight_setup.msi" /qn
)

if exist "C:\Program Files (x86)\TestNav" (
	echo ISTEP TestNav is already installed, skipping..
) else (
	echo Installing ISTEP TestNAV...
	msiexec /i "\\wcstech\Installs\ISTEP\testnav-1.7.3.msi" /qn
)

if exist "C:\Program Files (x86)\IndianaSecureBrowser" (
	echo Indiana Secure Browser is already installed, skipping...
) else (
	echo Installing Indiana Secure Browser...
	msiexec /i "\\wcstech\Installs\Indiana SecureBrowser\IndianaSecureBrowser10.4-2018-08-16.msi" /qn
)

if exist "C:\Program Files (x86)\Meraki" (
	echo Meraki is already installed, skipping...
) else (
	echo Installing Meraki...
	msiexec /i "\\wcstech\Installs\MerakiMerakiSM-Agent-computer-systems-manager.msi" /qn
)

if exist "C:\Program Files (x86)\VideoLAN\VLC" (
	echo VLC Player is already installed, skipping...
) else (
	echo Installing VLC Player...
	start /wait "" "\\wcstech\Installs\vlc\vlc-3.0.7-win32.exe" /S
)

if exist "C:\Program Files (x86)\Microsoft Office\Office16" (
	echo Microsoft Office 2016 Pro Plus is already installed, skipping...
) else (
	echo Installing Microsoft Office 2016 Pro Plus...
	start /wait "" "\\wcstech\Installs\microsoft\Office 2016 Pro Plus\setup.exe"
)

if exist "C:\Program Files (x86)\Google\Chrome" (
	echo Google Chrome is already installed, skipping...
) else (
	echo Installing Google Chrome...
	start /wait "" "\\wcstech\installs\Chrome\Win\Chrome Setup.exe"
)

if exist "C:\Program Files (x86)\Notepad++" (
	echo Notepad++ is already installed, skipping...
) else (
	echo Installing Notepad++...
	start /wait "" "\\wcstech\installs\notepad++\npp.6.8.3.Installer.exe" /S
)

if exist "C:\Program Files (x86)\QuickTime" (
	echo QuickTime is already installed, skipping...
) else (
	echo Installing Quicktime...
	msiexec /i "\\wcstech\installs\quicktime\AppleApplicationSupport.msi" /qn
	msiexec /i "\\wcstech\installs\quicktime\QuickTime.msi" /qn
)

if exist "C:\Program Files\Adobe\Adobe Animate CC 2019" (
	echo Adobe Animate CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Animate CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Animate and Mobile Device Packaging\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe After Effects CC 2019" (
	echo Adobe After Effects CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe After Effects CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\After Effects 16.1.1\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Bridge CC 2019" (
	echo Adobe Bridge CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Bridge CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Bridge CC 9.0.3\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Media Encoder CC 2019" (
	echo Adobe Media Encoder CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Media Encoder CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Media Encoder 13.1\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Dreamweaver CC 2019" (
	echo Adobe Dreamweaver CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Dreamweaver CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Dreamweaver 19.1\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Illustrator CC 2019" (
	echo Adobe Illustrator CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Illustrator CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Illustrator 23.0.3\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Photoshop CC 2019" (
	echo Adobe Photoshop CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Photoshop CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Photoshop CC 20.0.4\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Premiere Pro CC 2019" (
	echo Adobe Premiere Pro CC 2019...
) else (
	echo Installing Adobe Premiere Pro CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Premiere Pro 13.1.2\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Audition CC 2019" (
	echo Adobe Audition CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Audition CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Audition 12.1\Build\setup.exe" --silent
)

if exist "C:\Program Files\Adobe\Adobe Lightroom CC" (
	echo Adobe Lightroom CC 2019 is already installed, skipping...
) else (
	echo Installing Adobe Lightroom CC 2019...
	start /wait "" "\\wcstech\installs\adobe\2019-20\Win 64\Lightroom 2.3\Build\setup.exe" --silent
)

if exist "C:\Certiport" (
	echo Certiport is already installed, skipping...
) else (
	echo Installing Certiport...
	start /wait "" "\\wcstech\installs\Certiport Certification\Console 8\Console_Setup.exe" /Silent Path="C:\Certiport\Console" /LanguageCode ENU /ImpersonationUser Console8 /ImpersonationPassword C3rt1p0rt /ImpersonationDomain warsaw.wcs
)

REM enables User Account Control
reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f >nul

echo Done I think

if %choice%==s (
	shutdown /s /c "Software installed. Shutting down."
)

if %choice%==r (
	shutdown /r /c "Software installed. Restarting."
)

if %choice%==l (
	shutdown /l
)