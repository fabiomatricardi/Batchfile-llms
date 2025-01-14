# Batchfile-llms
Multiple choice batch file to run llama-server instances from terminal

The main idea: being able to run llama-server instances for a multiple choice of LLMs from the terminal

Why?
In the past months I worked on several projects using an unified process
- llama-server as the backend API server
- gradio/streamlit as GUI for the chatbots

The re-compliled llama.cpp binaries are really convenient, so that simply extracting the ZIP archive makes you up and running.

This means that we can have a single place for the binaries, and another one for the models

Using a batch file, easily customizable, with PATH for llama-cpp and PATH for the models, will make it fast to test them
