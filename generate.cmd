@echo off
:: #!C:\Windows\System32\Cmd.exe
:: coding:cp936
:: GoAgent APPID list generator
:: by ehs2013 <xiaodong.que+gaegen@gmail.com>
:: Thanks to the GoAgent Project
setlocal enabledelayedexpansion
for /f "tokens=1-2 delims=:" %%i in ('findstr /n ".*" appid.ini') do set _%%i=%%j
:: ���� appid ����
set line=429
:: proxy.ini ���� appid ����
set num=50
set i=0
echo �������� proxy.ini
:main
set /a rani=%random%%%%line%+1
set /p=!_%rani%!^|<nul>>tmp2
set /a i+=1
if %i% equ %num% goto gen
goto main
:gen
copy /b tmp1+tmp2+tmp3 proxy.ini >nul 2>nul
del tmp2 /f /s /q>nul 2>nul
echo GoAgent ������
python27.exe proxy.py
pause