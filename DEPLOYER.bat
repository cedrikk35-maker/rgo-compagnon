@echo off
echo ========================================
echo    RGO Compagnon - Deploiement
echo ========================================
echo.
echo Etape 1 : Installation des dependances...
call npm install
if errorlevel 1 goto error
echo.
echo Etape 2 : Construction de l'application...
call npm run build
if errorlevel 1 goto error
echo.
echo Etape 3 : Connexion a Firebase...
call npx firebase-tools login
echo.
echo Etape 4 : Deploiement en ligne...
call npx firebase-tools deploy --only hosting
if errorlevel 1 goto error
echo.
echo ========================================
echo    Deploiement termine !
echo    https://rgo-compgnon.web.app
echo ========================================
pause
exit /b 0

:error
echo.
echo ========================================
echo    ERREUR ! Le deploiement a echoue.
echo    Verifiez les messages ci-dessus.
echo ========================================
pause
exit /b 1
