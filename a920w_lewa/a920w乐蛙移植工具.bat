@echo off&echo.
color 1e
:MENU
cls
@echo ********************************************************
@echo          a920w lewa��ֲ����������v2.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/23
@echo ********************************************************
echo --------------------------------------------------------
echo .ʹ��ǰ������׿��C2���ܵװ� ��zip�ļ�����suda�ļ���
echo .�����߻���׿��C2���ܰ����� ����������δ������
echo .�벻Ҫ�޸��ļ��к��ļ��� ���򹤾߽��޷�����
echo .������ԭ�����Ͷ� ת����ע������
echo --------------------------------------------------------

echo --------------------------------------------------------
echo   1.����C2����rom
echo   2.����A920W����rom
echo   3.�˳�����
echo --------------------------------------------------------

:CHO
set choice=
set /p choice= ѡ����Ҫ���еĲ���:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto DOW
if /i "%choice%"=="2" goto MAKE
if /i "%choice%"=="3" exit
echo ѡ����Ч������������
echo.
goto MENU


:DOW
start http://bbs.lewaos.com/down_detail.php?id=42
goto MENU

:MAKE
buding\7z x suda\*.zip  -osuda\
del suda\*.zip



del suda\scatter.txt
del suda\SEC_VER.txt
del suda\type.txt


rd /s /q suda\system\lib\moudle
rd /s /q suda\system\lib\hw
rd /s /q suda\system\etc\firmware
rd /s /q suda\system\etc\mddb
rd /s /q suda\system\vendor\lib


xcopy  /e/I/h/r/y/s "buding\suda" "suda" 


for %%i in (suda\system\build.prop) do echo ro.lewa.version=LeWa_OS5.1_%date:~2,2%.%date:~5,2%.%date:~8,2%   >>%%i


buding\7z a suda\Lewa_AMOI_A920W_%date:~2,2%.%date:~5,2%.%date:~8,2%.zip .\suda\*
@echo ********************************************************
@echo                       �������
@echo                         ллʹ��
@echo                                            ����By suda
@echo ********************************************************
@echo �밴������˳�����
pause>nul
Exit

:END

