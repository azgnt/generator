@echo off

:: Set the Python executable path
set PYTHON_EXECUTABLE=python.exe

:: Set the script path
set SCRIPT_PATH=gen.py

:: Set the config file path
set CONFIG_FILE=data\config.json

:: Set the proxies file path
set PROXIES_FILE=data\proxies.txt

:: Set the tokens file path
set TOKENS_FILE=data\tokens.txt

:: Set the usernames file path
set USERNAMES_FILE=data\usernames.txt

:: Set the accounts file path
set ACCOUNTS_FILE=data\accounts.txt

:: Create the data folder if it doesn't exist
if not exist data (
    mkdir data
)

:: Create the config file if it doesn't exist
if not exist %CONFIG_FILE% (
    echo Creating config file...
    echo {
    echo     "capmonster_key": "YOUR_CAPMONSTER_KEY_HERE",
    echo     "invite_code": "YOUR_INVITE_CODE_HERE",
    echo     "password": "YOUR_PASSWORD_HERE",
    echo     "proxy_type": "http",
    echo     "proxy_timeout": 10,
    echo     "username_format": "username{}",
    echo     "token_format": "token{}",
    echo     "account_format": "account{}",
    echo     "num_accounts": 10,
    echo     "num_tokens": 10,
    echo     "num_usernames": 10
    echo } > %CONFIG_FILE%
)

:: Create the proxies file if it doesn't exist
if not exist %PROXIES_FILE% (
    echo Creating proxies file...
    type nul > %PROXIES_FILE%
)

:: Create the tokens file if it doesn't exist
if not exist %TOKENS_FILE% (
    echo Creating tokens file...
    type nul > %TOKENS_FILE%
)

:: Create the usernames file if it doesn't exist
if not exist %USERNAMES_FILE% (
    echo Creating usernames file...
    type nul > %USERNAMES_FILE%
)

:: Create the accounts file if it doesn't exist
if not exist %ACCOUNTS_FILE% (
    echo Creating accounts file...
    type nul > %ACCOUNTS_FILE%
)

:: Run the script
%PYTHON_EXECUTABLE% %SCRIPT_PATH%

:: Pause the command prompt
pause
