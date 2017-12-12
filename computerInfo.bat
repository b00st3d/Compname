cls
cd %~dp0%
@echo off
cls
echo Please keep this window up...I am verifying MD5 Checksum hashes on all required data...
echo Username: %username% >> computerInfo.txt
echo Computer Name: %computername% >> computerInfo.txt
echo why are you looking at me
echo -.-
FOR /F %%A IN ('getmac') DO SET MAC=%%A
	echo Mac Address: %MAC% >> computerInfo.txt
for /F "skip=2 tokens=2 delims=," %%A in ('wmic systemenclosure get serialnumber /FORMAT:csv') do (set "serial=%%A")
	echo serial number: %serial% >> computerInfo.txt
for /F "skip=2 tokens=2 delims=," %%A in ('wmic computersystem get model /FORMAT:csv') do (set "model=%%A")
	echo model: %model% >> computerInfo.txt
echo. >> computerInfo.txt
echo ________________________________________________ >> computerInfo.txt
echo. >> computerInfo.txt
cls
echo complete...here comes the popup!
::start message
echo msgbox "Your computername is %computername%" ^& vbcrlf ^&  "Your serial number is %serial%", vbOKCancel > %temp%\popupCompname.vbs
wscript.exe %temp%\popupCompname.vbs

::cleanup
del %temp%popupCompname.vbs
exit