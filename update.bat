@echo off
:: Geen setlocal om fouten te voorkomen

echo ============================================
echo      Update_Schip_New_Mexico_Safe
echo ============================================

:: 1. Controleer op Admin rechten
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [FOUT] Rechtermuisknop -> Als administrator uitvoeren.
    pause
    exit /b
)

:: 2. Map instellen
set appDir=C:\Program Files (x86)\MS New Mexico
set baseUrl=https://raw.githubusercontent.com/Coderingbinnenvaart/Update_MS_NewMexico/refs/heads/main

:: 3. Elk bestand handmatig (geen ingewikkelde codes)

echo Bezig met reizen.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/reizen.html' -OutFile '%TEMP%\reizen.html'"
if exist "%appDir%\reizen.html" attrib -h -s -r "%appDir%\reizen.html"
move /y "%TEMP%\reizen.html" "%appDir%\reizen.html" >nul
attrib +h +s +r "%appDir%\reizen.html"

echo Bezig met adn.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/adn.html' -OutFile '%TEMP%\adn.html'"
if exist "%appDir%\adn.html" attrib -h -s -r "%appDir%\adn.html"
move /y "%TEMP%\adn.html" "%appDir%\adn.html" >nul
attrib +h +s +r "%appDir%\adn.html"

echo Bezig met index.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/index.html' -OutFile '%TEMP%\index.html'"
if exist "%appDir%\index.html" attrib -h -s -r "%appDir%\index.html"
move /y "%TEMP%\index.html" "%appDir%\index.html" >nul
attrib +h +s +r "%appDir%\index.html"

echo Bezig met waterstanden.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/waterstanden.html' -OutFile '%TEMP%\waterstanden.html'"
if exist "%appDir%\waterstanden.html" attrib -h -s -r "%appDir%\waterstanden.html"
move /y "%TEMP%\waterstanden.html" "%appDir%\waterstanden.html" >nul
attrib +h +s +r "%appDir%\waterstanden.html"

echo Bezig met Hafenmeester duisburg.html...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%baseUrl%/Hafenmeester%%20duisburg.html' -OutFile '%TEMP%\Hafenmeester duisburg.html'"
if exist "%appDir%\Hafenmeester duisburg.html" attrib -h -s -r "%appDir%\Hafenmeester duisburg.html"
move /y "%TEMP%\Hafenmeester duisburg.html" "%appDir%\Hafenmeester duisburg.html" >nul
attrib +h +s +r "%appDir%\Hafenmeester duisburg.html"

echo.
echo ============================================
echo      KLAAR! Alle bestanden bijgewerkt.
echo ============================================
pause