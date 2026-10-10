@echo off
chcp 65001 >nul
setlocal

:: ====== USTAWIENIA - wpisz nazwy z kolumny "Name" w SoundVolumeView ======
set "MONITOR=NAZWA_MONITORA"
set "HEADPHONES=NAZWA_SLUCHAWEK"
:: =========================================================================

:: Włączanie/wyłączanie urządzeń wymaga uprawnień administratora - skrypt sam o nie poprosi
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set "SVV=%~dp0SoundVolumeView.exe"
if not exist "%SVV%" (
    echo Nie znaleziono SoundVolumeView.exe obok tego skryptu.
    pause
    exit /b 1
)

echo [1/4] Wlaczam monitor...
"%SVV%" /Enable "%MONITOR%"
timeout /t 2 /nobreak >nul

echo [2/4] Przelaczam na monitor...
"%SVV%" /SetDefault "%MONITOR%" all
timeout /t 2 /nobreak >nul

echo [3/4] Wracam na sluchawki...
"%SVV%" /SetDefault "%HEADPHONES%" all
timeout /t 2 /nobreak >nul

echo [4/4] Wylaczam monitor...
"%SVV%" /Disable "%MONITOR%"

echo Gotowe.
timeout /t 2 /nobreak >nul
