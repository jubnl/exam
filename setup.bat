@echo off

REM Create a virtual environment and activate it
python -m venv .venv
if errorlevel 1 (
    echo Failed to create virtual environment.
    exit /b 1
)

CALL .venv\Scripts\activate.bat
if errorlevel 1 (
    echo Failed to activate virtual environment.
    exit /b 1
)

REM Install dependencies from requirements.txt
pip install -r requirements.txt
if errorlevel 1 (
    echo Failed to install dependencies.
    exit /b 1
)

REM build the docs
mkdocs build
if errorlevel 1 (
    echo Failed to build the documentation.
    exit /b 1
)
