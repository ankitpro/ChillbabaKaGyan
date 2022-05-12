@echo off
Powershell.exe -executionpolicy remotesigned -File "%~dp0\connectToVM.ps1"
pause