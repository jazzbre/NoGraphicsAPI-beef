@echo off
setlocal
pushd "%~dp0"
cmake -S . -B build\windows_vs2022 -G "Visual Studio 17 2022" -A x64
if errorlevel 1 goto failed
cmake --build build\windows_vs2022 --config Debug --parallel
if errorlevel 1 goto failed
cmake --build build\windows_vs2022 --config Release --parallel
if errorlevel 1 goto failed
popd
exit /b 0
:failed
popd
exit /b 1
