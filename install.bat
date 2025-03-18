@echo off
:: Installation script for Loan Calculator Web Server (Windows)
:: This script helps set up and run the loan calculator web server

SETLOCAL EnableExtensions EnableDelayedExpansion

:: Default port
SET DEFAULT_PORT=8000

:: Colors for Windows console
SET GREEN=92
SET BLUE=94
SET YELLOW=93
SET RED=91
SET WHITE=97
SET BOLD=1

TITLE Loan Calculator Web Server Installation

:: Header function
CALL :print_header
CALL :check_nodejs
CALL :install_dependencies

:: Check if port parameter is provided
IF "%~1"=="" (
    ECHO.
    CALL :colorEcho %YELLOW% "No port specified, using default port %DEFAULT_PORT%"
    CALL :start_server %DEFAULT_PORT%
) ELSE (
    CALL :start_server %~1
)

EXIT /B 0

:print_header
ECHO.
CALL :colorEcho %BLUE%%BOLD% "================================================="
ECHO.
CALL :colorEcho %BLUE%%BOLD% "           Loan Calculator Web Server           "
ECHO.
CALL :colorEcho %BLUE%%BOLD% "             Installation Script                "
ECHO.
CALL :colorEcho %BLUE%%BOLD% "================================================="
ECHO.
EXIT /B 0

:check_nodejs
CALL :colorEcho %YELLOW% "Checking for Node.js..."
WHERE node >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    CALL :colorEcho %RED% "Node.js could not be found!"
    ECHO Please install Node.js from https://nodejs.org/
    EXIT 1
)

FOR /F "tokens=*" %%i IN ('node -v') DO SET NODE_VERSION=%%i
CALL :colorEcho %GREEN% "Node.js found: !NODE_VERSION!"
ECHO.
EXIT /B 0

:install_dependencies
CALL :colorEcho %YELLOW% "Installing npm dependencies..."
IF EXIST "package.json" (
    CALL npm install
    CALL :colorEcho %GREEN% "Dependencies installed successfully!"
) ELSE (
    CALL :colorEcho %RED% "Error: package.json not found!"
    EXIT 1
)
EXIT /B 0

:start_server
SET PORT=%~1
ECHO.
CALL :colorEcho %YELLOW% "Starting the web server on port %PORT%..."
CALL :colorEcho %GREEN% "Web server is running at http://localhost:%PORT%/"
CALL :colorEcho %BLUE% "Press Ctrl+C to stop the server"
ECHO.

:: Start the server
node server.js %PORT%
EXIT /B 0

:colorEcho
:: Usage: CALL :colorEcho COLOR "text"
SET "param=^%~2" !
SET "param=!param:"=\"!"
powershell write-host -foregroundcolor %~1 "!param!"
EXIT /B 0
