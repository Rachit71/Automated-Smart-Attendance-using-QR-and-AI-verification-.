@echo off
setlocal
cd /d "%~dp0"
echo Installing local jsQR QR code reader...
where npm >nul 2>nul
if errorlevel 1 (
 echo ERROR: Node.js/npm not found. Install Node.js first.
 pause
 exit /b 1
)
call npm install --prefix ".\js\vendor" --no-audit --no-fund --save-exact jsqr@1.4.0
if errorlevel 1 (
 echo ERROR: Could not install jsQR. Check internet connection and try again.
 pause
 exit /b 1
)
if not exist ".\js\vendor\node_modules\jsqr\dist\jsQR.js" (
 echo ERROR: jsQR library file was not found after installation.
 pause
 exit /b 1
)
echo SUCCESS: jsQR installed. Refresh your mobile Scan QR page.
pause
