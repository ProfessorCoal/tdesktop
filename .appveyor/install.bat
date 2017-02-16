@echo off
SET BUILD_DIR=C:\TBuild
set LIB_DIR=%BUILD_DIR%\Libraries
SET QT_VERSION=5_6_2

cd %BUILD_DIR%

call:getDependencies

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
	
	dir
GOTO:EOF
