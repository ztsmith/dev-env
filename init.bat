:: Init Script for cmd.exe
:: Sets some nice defaults
:: Created as part of cmder project

:: Find root dir
@if not defined CMDER_ROOT (
    for /f %%i in ("%ConEmuDir%\..\..") do @set CMDER_ROOT=%%~fi
)

:: Change the prompt style
:: Mmm tasty lamb
@prompt $E[1;32;40m$P$S{git}$S$_$E[1;30;40m{lamb}$S$E[0m

:: Pick right version of clink
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set architecture=86
) else (
    set architecture=64
)

:: Run clink
@"%CMDER_ROOT%\vendor\clink\clink_x%architecture%.exe" inject --quiet --profile "%CMDER_ROOT%\config"

:: Prepare for msysgit

:: I do not even know, copypasted from their .bat
@set PLINK_PROTOCOL=ssh
@if not defined TERM set TERM=cygwin

:: Enhance Path
@set git_install_root=%CMDER_ROOT%\vendor\msysgit
@set PATH=%CMDER_ROOT%\bin;%git_install_root%\bin;%git_install_root%\mingw\bin;%git_install_root%\cmd;%git_install_root%\share\vim\vim74;%CMDER_ROOT%;%PATH%

:: Add aliases
@doskey /macrofile="%CMDER_ROOT%\config\aliases"

:: Set home path
@if not defined HOME set HOME=%USERPROFILE%

@if defined CMDER_START (
    @cd /d "%CMDER_START%"
) else (
    @if "%CD%\" == "%CMDER_ROOT%" (
        @cd /d "%HOME%"
    )
)

@ECHO OFF

REM Set default sock file
SET SSH_AUTH_SOCK=/tmp/ssh-agent.sock

REM Check socket is available
IF NOT EXIST "%TMP%\ssh-agent.sock" GOTO:RUNAGENT

REM Check if an ssh-agent is running
FOR /f "tokens=*" %%I IN ('ps ^| grep ssh-agent ^| sed "s/^ *\([0-9]\+\) .*/\1/"') DO SET VAR=%%I
IF "%VAR%" == "" GOTO:RUNAGENT

REM Check if socket file is valid
ssh-add -l 1> NUL 2>&1
IF ERRORLEVEL 1 GOTO:RUNAGENT
GOTO:ADDKEYS

:RUNAGENT
REM Remove old socket file
rm -f /tmp/ssh-agent.sock

REM Run ssh-agent and save (last) PID in VAR
SET VAR=
FOR /f "tokens=*" %%J IN ('ssh-agent -a /tmp/ssh-agent.sock') DO FOR /f "tokens=*" %%K IN ('echo %%J ^| grep "SSH_AGENT_PID" ^| sed "s/^SSH_AGENT_PID=\([0-9]\+\); .*/\1/"') DO SET VAR=%%K

:ADDKEYS
SET SSH_AUTH_PID=%VAR%

REM Check if ssh keys are known
SET KEYS=
FOR /f "tokens=*" %%I IN ('DIR /B "%HOME%\.ssh\*_rsa"') DO CALL:CHECKKEY %%I

REM Add missing ssh keys at once
IF NOT "%KEYS%" == "" ssh-add %KEYS%
GOTO:END

REM Functions
REM Check if ssh key has to be added
:CHECKKEY
SET VAR=
FOR /f "tokens=*" %%J IN ('ssh-add -l ^| grep "%1"') DO SET VAR=%%J
IF "%VAR%" == "" SET KEYS='%HOME%\.ssh\%1' %KEYS%
GOTO:EOF

:END
@ECHO ON