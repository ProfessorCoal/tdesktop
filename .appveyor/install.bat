@echo off
SET BUILD_DIR=C:\TBuild
set LIB_DIR=%BUILD_DIR%\Libraries
set SRC_DIR=%BUILD_DIR%\tdesktop
SET QT_VERSION=5_6_2

cd %BUILD_DIR%

call:getDependencies
call:setupGYP

echo Finished!

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF

:getDependencies
    call:logInfo "Clone dependencies repository"
    git clone -q --branch=master https://github.com/telegramdesktop/dependencies_windows.git %LIB_DIR%
    cd %LIB_DIR%
	
	call prepare.bat
GOTO:EOF

:setupGYP
    call:logInfo "Setup GYP/Ninja and generate VS solution"
    cd %LIB_DIR%
	git clone https://chromium.googlesource.com/external/gyp
    SET PATH=%PATH%;C:\TBuild\Libraries\gyp;C:\TBuild\Libraries\ninja;
    cd ..\tdesktop\Telegram
    call gyp\refresh.bat
GOTO:EOF
