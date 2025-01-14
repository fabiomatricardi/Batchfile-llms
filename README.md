# Batchfile-llms
Multiple choice batch file to run llama-server instances from terminal

<img src='https://github.com/fabiomatricardi/Batchfile-llms/raw/main/2025-01-14%2015%2039%2021.png' width=800>

### The main idea: 
being able to run llama-server instances for a multiple choice of LLMs from the terminal

### Why?
In the past months I worked on several projects using an unified process
- llama-server as the backend API server
- gradio/streamlit as GUI for the chatbots

### how it is done
The re-compliled llama.cpp binaries are really convenient, so that simply extracting the ZIP archive makes you up and running.

This means that we can have a single place for the binaries, and another one for the models

Using a batch file, easily customizable, with `PATH` for llama-cpp and `PATH` for the models, will make it fast to test them

When you press a valid choice a new terminal will run the llama-server instance

<img src='https://github.com/fabiomatricardi/Batchfile-llms/raw/main/2025-01-14%2015%2037%2024.png' width=350> <img src='https://github.com/fabiomatricardi/Batchfile-llms/raw/main/2025-01-14%2015%2040%2005.png' width=350>

### Content
- an example file with my code - `testChoices.bat`
- a text file with the correct escape code working fine on normal windows `cmd`


Take a look
```batch
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

```

