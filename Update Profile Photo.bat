@echo off
setlocal
title Update Portfolio Profile Photo

set "REPO=C:\Users\User\Documents\Codex\2026-09-02\ca\work\my-portfolio-github-stage"
set "GIT=C:\Program Files\Git\cmd\git.exe"

if not exist "%GIT%" (
  echo Git for Windows was not found.
  pause
  exit /b 1
)

cd /d "%REPO%"
"%GIT%" restore --source=149ae25 -- "assets/img/profile/mukesh-awasthi.jpeg"
copy /y "D:\my portfolio\index.html" "index.html" >nul
copy /y "D:\my portfolio\assets\css\main.css" "assets\css\main.css" >nul
copy /y "D:\my portfolio\assets\img\profile\mukesh-awasthi-profile.jpeg" "assets\img\profile\mukesh-awasthi-profile.jpeg" >nul
"%GIT%" add index.html assets/css/main.css assets/img/profile/mukesh-awasthi.jpeg assets/img/profile/mukesh-awasthi-profile.jpeg
"%GIT%" diff --cached --quiet
if errorlevel 1 "%GIT%" commit -m "Refine profile photo placement"
"%GIT%" push origin main

if errorlevel 1 (
  echo.
  echo The update did not finish. Check your GitHub sign-in, then try again.
) else (
  echo.
  echo Success! Your profile photo update is now on GitHub.
)

pause
