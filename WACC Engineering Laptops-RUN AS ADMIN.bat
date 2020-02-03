@echo off
echo Note: Autodesk Inventor HSM will not be installed.
echo Note: RoboCell and ProLight 1000 will need to have their licenses activated manually.
echo Note: The computer will restart after installing Inventor, and an admin will need to log in to make sure it finishes
echo       installing.
echo --------------------------------------------------------------------------------------------------------------------

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
)else (
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

if exist "C:\Intelitek\RoboCell" (
	echo RoboCell is already installed, skipping...
) else (
	echo Installing RoboCell...
	msiexec /i "\\wcstech\installs\pltw\2016-2017\RoboCell\installer\Robocell 5.6.1_B1 64bit.msi" /qn
)

if exist "C:\Program Files (x86)\RobotShop\FlowArmPLTW_4" (
	echo FlowArm is already installed, skipping...
) else (
	echo Installing FlowArm...
	start /wait "" "\\wcstech\installs\pltw\2018-2019\FlowArm\setupflowarmpltw4_3_0_1.exe" /S
)

if exist "C:\Program Files (x86)\Robomatter Inc\ROBOTC Development Environment 4.X" (
	echo ROBOTC is already installed, skipping...
) else (
	echo Installing ROBOTC...
	msiexec /i "\\wcstech\installs\pltw\2017-2018\ROBOTC\ROBOTCforVEXRobotics_455Release.msi" /qn
)

if exist "C:\Program Files (x86)\Intelitek\CNCMotion for proLIGHT 1000 Machining Center" (
	echo ProLight 1000 is already installed, skipping...
) else (
	echo Installing ProLight 1000...
	msiexec /i "\\wcstech\installs\pltw\2016-2017\ProLight 1000\installer\ProLight 1000 64bit.msi" /qn /norestart
)

if exist "C:\Program Files\Autodesk\Inventor 2019" (
	echo Autodesk Inventor 2019 is already installed, skipping...
) else (
	echo Installing Autodesk Inventor 2019...
	mkdir c:\temp_pltw
	mkdir c:\temp_pltw\Inventor_2019
	start /wait "" robocopy \\wcstech\installs\pltw\2018-2019\Autodesk\Inventor_2019 c:\temp_pltw\Inventor_2019 /E /S
	start /wait "" c:\temp_pltw\Inventor_2019\Inventor_2019.lnk
	:waiti
	tasklist /FI "IMAGENAME eq Setup.exe" 2>NUL | find /I /N "Setup.exe">NUL
	if "%ERRORLEVEL%"=="0" goto waiti
	del /Q "C:\temp_pltw"
	shutdown /r
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