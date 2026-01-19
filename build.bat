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
    echo [Success] Done.
) else (
    echo [Fail] PyInstaller failed.
)

pause