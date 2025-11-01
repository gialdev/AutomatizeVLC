@echo off
color 0A
Title GialDev - HDMI (VLC AutoPlay)
REM ===========================================================
REM  SCRIPT: Iniciar Videos en Segunda Pantalla (HDMI)
REM  OBJETIVO: Reproducir automáticamente todos los videos 
REM             desde C:\ProgramData\Videos usando VLC
REM  MODO: Se ejecuta al iniciar la PC y sigue hasta apagarla
REM ===========================================================

REM === RUTA DE VLC ===
set "VLC=C:\Program Files\VideoLAN\VLC\vlc.exe"

echo Verificando VLC en: %VLC%
if not exist "%VLC%" (
    echo ERROR: No se encontro VLC en esa ruta.
    exit /b 1
)

REM === CARPETA DE VIDEOS ===
set "VIDEOS=C:\ProgramData\Videos"

echo Verificando carpeta de videos: %VIDEOS%
if not exist "%VIDEOS%" (
    echo ERROR: No existe la carpeta de videos.
    exit /b 1
)

REM === ESPERA INICIAL (para asegurar que todo el sistema arranque) ===
echo Esperando 10 segundos para iniciar...
timeout /t 10 /nobreak

REM === CONSTRUIR LISTA DE VIDEOS ===
echo Buscando videos en %VIDEOS%...
setlocal enabledelayedexpansion
set "FILELIST="

for %%F in ("%VIDEOS%\*.mp4" "%VIDEOS%\*.avi" "%VIDEOS%\*.mkv" "%VIDEOS%\*.mov" "%VIDEOS%\*.wmv") do (
    if exist "%%~F" (
        set "FILELIST=!FILELIST! ""%%~F"""
    )
)

REM === VERIFICAR SI SE ENCONTRARON VIDEOS ===
if "%FILELIST%"=="" (
    echo No se encontraron videos en %VIDEOS%.
    exit /b
)

echo Lanzando VLC en pantalla completa (monitor 2)...
REM === LANZAR VLC EN BUCLE INFINITO EN LA SEGUNDA PANTALLA ===
start "" "%VLC%" !FILELIST! --fullscreen --loop --no-video-title-show --qt-fullscreen-screennumber=1 --playlist-autostart --no-qt-name-in-title

echo Monitoreando VLC (revisando cada 60s). Presiona Ctrl+C para salir.
REM === MANTENER EL SCRIPT ACTIVO EN SEGUNDO PLANO HASTA APAGAR LA PC ===
:waitloop
timeout /t 60 /nobreak
tasklist | find /i "vlc.exe" >nul
if not errorlevel 1 goto waitloop

exit
