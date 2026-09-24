@echo off
setlocal
pushd "%~dp0" || exit /b 1

where git >nul 2>nul
if errorlevel 1 (
    echo Git was not found on PATH.
    goto failed
)
python tools\generate_bindings.py --check-tools
if errorlevel 1 goto failed

if exist "submodules\NoGraphicsAPI\.git" (
    git -C submodules\NoGraphicsAPI rev-parse --is-inside-work-tree >nul
    if errorlevel 1 goto failed
    git -C submodules\NoGraphicsAPI diff --quiet --ignore-submodules=none
    if errorlevel 2 goto failed
    if errorlevel 1 goto dirty
    git -C submodules\NoGraphicsAPI diff --cached --quiet --ignore-submodules=none
    if errorlevel 2 goto failed
    if errorlevel 1 goto dirty
    for /f "delims=" %%F in ('git -C submodules\NoGraphicsAPI ls-files --others --exclude-standard') do goto dirty
)

git submodule sync --recursive -- submodules/NoGraphicsAPI
if errorlevel 1 goto failed
git submodule update --init --remote --recursive --checkout -- submodules/NoGraphicsAPI
if errorlevel 1 goto failed
python tools\generate_bindings.py
if errorlevel 1 goto failed

echo Submodule updated and bindings regenerated.
echo Run build_windows_vs2022.cmd and beefbuild to rebuild.
popd
exit /b 0

:dirty
echo The NoGraphicsAPI submodule has local changes. Commit or stash them before updating.
:failed
popd
exit /b 1
