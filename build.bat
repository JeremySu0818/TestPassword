@echo off
call .venv\Scripts\activate

python setup.py build_ext --inplace

if %errorlevel% neq 0 (
    echo [Fail] Compilation failed.
    pause
    exit /b %errorlevel%
)

pyinstaller --icon="icon.ico" ^
    --add-data="TestingCore.cp311-win_amd64.pyd;." ^
    --onefile ^
    --console ^
    TestPassword.py

if %errorlevel% equ 0 (
    echo [Success] PyInstaller Done.
    
    echo [Info] Starting Inno Setup compilation...
    "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" installer.iss
    
    if %errorlevel% equ 0 (
        echo [Success] Installer created successfully.
    ) else (
        echo [Fail] Inno Setup compilation failed.
    )
    
) else (
    echo [Fail] PyInstaller failed.
)

pause