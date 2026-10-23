@echo off
chcp 65001 >nul
title actiwation

:: checking admin permisions
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run this script with admin permisions
    pause
    exit /b
)

:MENU
cls
echo ========================================================
echo                                         ACTIWIATION
echo ========================================================
echo [1] Windows (7 / 8.1 / 10 / 11)
echo [2] Microsoft Office (2010 - 2021/2024)
echo [3] Exit
echo ========================================================
set /p choice="chose a option (1-3): "

if "%choice%"=="1" goto ACTIVATE_WIN
if "%choice%"=="2" goto ACTIVATE_OFFICE
if "%choice%"=="3" exit /b
goto MENU

:ACTIVATE_WIN
cls
echo ========================================================
echo                                WINDOWS WITH KMS
echo ========================================================
echo Setting up KMS-server...

:: connecting to KMS
slmgr /skms kms.digiboy.ir

echo sending signal...
slmgr /ato

echo.
echo Mision complete 100% check in settings
pause
goto MENU

:ACTIVATE_OFFICE
cls
echo ========================================================
echo              MICROSOFT OFFICE
echo ========================================================
echo Spy is serching for MS Office...

set "OFFICE_PATH="
if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" set "OFFICE_PATH=%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" set "OFFICE_PATH=%ProgramFiles(x86)%\Microsoft Office\Office16"
if exist "%ProgramFiles%\Microsoft Office\Office15\OSPP.VBS" set "OFFICE_PATH=%ProgramFiles%\Microsoft Office\Office15"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\OSPP.VBS" set "OFFICE_PATH=%ProgramFiles(x86)%\Microsoft Office\Office15"
if exist "%ProgramFiles%\Microsoft Office\Office14\OSPP.VBS" set "OFFICE_PATH=%ProgramFiles%\Microsoft Office\Office14"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\OSPP.VBS" set "OFFICE_PATH=%ProgramFiles(x86)%\Microsoft Office\Office14"

if "%OFFICE_PATH%"=="" (
    echo [ОШИБКА] MS Office not found :(!
    pause
    goto MENU
)

cd /d "%OFFICE_PATH%"
echo Spy is found MS office: %OFFICE_PATH%
echo setting up the kms server...
cscript ospp.vbs /sethst:kms.digiboy.ir
echo Actiwation in progress...
cscript ospp.vbs /act

echo.
echo Mision complete!
pause
goto MENU