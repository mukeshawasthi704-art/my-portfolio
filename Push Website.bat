@echo off
setlocal
title Push My Portfolio to GitHub

set "REPO=C:\Users\User\Documents\Codex\2026-09-02\ca\work\my-portfolio-github-stage"
set "GIT=C:\Program Files\Git\cmd\git.exe"

if not exist "%GIT%" (
  echo Git for Windows was not found.
  echo Please install Git for Windows, then try again.
  pause
  exit /b 1
)

if not exist "%REPO%\.git" (
  echo The portfolio GitHub folder was not found.
  echo Please open Codex and ask for help.
  pause
  exit /b 1
)

cd /d "%REPO%"
echo.
echo Publishing your prepared website updates to GitHub...
echo.
"%GIT%" push origin main

if errorlevel 1 (
  echo.
  echo The push did not finish. Check your GitHub sign-in, then try again.
) else (
  echo.
  echo Success! Your website updates are now on GitHub.
)

echo.
pause
