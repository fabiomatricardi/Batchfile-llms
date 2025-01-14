:: source https://stackoverflow.com/questions/14529246/multiple-choices-menu-on-batch-file
:: color codes from 
:: https://gist.githubusercontent.com/mlocati/fdabcaeb8071d5c75a2d51712db24011/raw/b710612d6320df7e146508094e84b92b34c77d48/win10colors.cmd

@echo off
:START
echo [92m
set SRV=C:\Users\FabioMatricardi\Documents\DEV\SmolLM2-360M_gradio\llamacpp
echo.
echo ===================================================
echo What MODEL would you like to Run as a llama-server?
echo ===================================================
echo 1 - SmolLM2-360M-Instruct.Q8_0.gguf
echo 2 - SmolLM2-135M-Instruct-f16.gguf
echo 3 - llamaestra-3.2-1b-instruct-v0.1-q8_0.gguf
echo 4 - EXIT

set /p whatapp=

if %whatapp%==1 (goto MODEL1
) else if %whatapp%==2 (goto MODEL2 
) else if %whatapp%==3 (goto MODEL3
) else if %whatapp%==4 (goto QUIT
) else (goto :INVALID)

:MODEL1
cls
echo Starting llama-server API for SmolLM2-360M-Instruct.Q8_0.gguf
echo start cmd.exe /k D:\SmolLM2-360M_gradio\llamacpp\llama-server.exe -m D:\SmolLM2-360M_gradio\llamacpp\model\SmolLM2-360M-Instruct.Q8_0.gguf -c 8192 -ngl 0
start cmd.exe /k "%SRV%\llama-server.exe -m %SRV%\model\SmolLM2-360M-Instruct.Q8_0.gguf -c 8192 -ngl 0"
goto :START

:MODEL2
cls
echo Starting llama-server API for SmolLM2-135M-Instruct-f16.gguf
start cmd.exe /k "%SRV%\llama-server.exe -m %SRV%\model\SmolLM2-135M-Instruct-f16.gguf -c 8192 -ngl 0"
goto :START

:MODEL3
cls
echo Starting llama-server API for llamaestra-3.2-1b-instruct-v0.1-q8_0.gguf
start cmd.exe /k "%SRV%\llama-server.exe -m %SRV%\model\llamaestra-3.2-1b-instruct-v0.1-q8_0.gguf -c 8192 -ngl 0"
goto :START

:INVALID
cls
echo [44m [1m [93m
echo INVALID CHOICE
echo [0m
goto :START

:QUIT
cls
echo [91mBYE BYE
echo [0m
pause
exit




