@echo off
color 1e
title suda ���ܾ��򹤾�
@echo ********************************************************
@echo         p770 lewa�����Ż�����������v3.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/28
@echo ********************************************************
echo --------------------------------------------------------
echo .ʹ��ǰ��ò���˵��
echo .�����������Ͷ� ת����ע��
echo .����ϵͳǰ�����ѡ���Ƿ����odex�ϲ�
echo .�벻Ҫ�޸��ļ��к��ļ��� ���򹤾߽��޷�����
echo --------------------------------------------------------
echo ���������ʼ���
pause>nul

if exist suda\*.zip (goto :Dec) else cls
echo.
echo ������zip�ļ������Ѿ���ѹ
echo �����������˵�
ping 127.0.0.1 -n 2 >NUL
goto CHO

:Dec
buding\7z x suda\*.zip  -osuda\ 
del suda\*.zip
echo.
echo ������
echo �����������˵�
ping 127.0.0.1 -n 2 >NUL
goto CHO

:CHO
cls
@echo ********************************************************
@echo         p770 lewa�����Ż�����������v3.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/28
@echo ********************************************************
echo --------------------------------------------------------
echo --------------------------------------------------------
echo   1.����odex�ϲ� 
echo   2.���������
echo   3.�������°�����rom
echo   4.�鿴˵��
echo   5.�˳�����
echo --------------------------------------------------------

set choice=
set /p choice= ѡ����Ҫ���еĲ���:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto ODEX
if /i "%choice%"=="2" goto CHO1
if /i "%choice%"=="3" goto DOW 
if /i "%choice%"=="4" goto HELP
if /i "%choice%"=="5" EXIT
echo ѡ����Ч������������
ping 127.0.0.1 -n 2 >NUL
echo.
goto CHO

:DOW
start http://bbs.lewaos.com/down_detail.php?id=11
goto CHO


:CHO1
cls
@echo ********************************************************
@echo         p770 lewa�����Ż�����������v3.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/28
@echo ********************************************************
echo --------------------------------------------------------
echo --------------------------------------------------------
echo   1.���������(δodex�ϲ�)  
echo   2.���������(��odex�ϲ�)
echo   3.�������˵�
echo   4.�˳�����
echo --------------------------------------------------------



set choice=
set /p choice= ѡ����Ҫ���еĲ���:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" buding\odex_0.bat
if /i "%choice%"=="2" buding\odex_1.bat
if /i "%choice%"=="3" goto CHO
if /i "%choice%"=="4" EXIT
echo ѡ����Ч������������
ping 127.0.0.1 -n 2 >NUL
echo.
goto CHO1

:HELP
cls
echo --------------------------------------------------------
echo ˵����
echo .�뽫���ܹٷ���zip�ļ�����suda�ļ�����
echo .˫���������������.bat �ȴ��������
echo .��ѹ���̳���(Y)es / (N)o / (A)lways / (S)kip all / A(u)to rename all / (Q)uit?
echo .������a��س�
echo .������ δ�ҵ� *****
echo .����odex�ϲ�����Ҫ����java���� �����аٶ� odexδ�ϲ�������Ҫ��
echo .ʱ����п���һ��ʱ����޷����� �������fc �������߸�Ŀ¼�滻δ�޸ĵ�SystemUI.apk
echo .�����ƹ��ܼ��ɵ�Mtktweak�� 
echo .������Ŀ�ɽ���buding�޸�odex_0.bat��odex_1
echo --------------------------------------------------------
echo ������Ŀ��
echo .����odex�ϲ�����
echo .����zip�����������ڱ仯
echo .�Ż�gps
echo .���»���
echo .ʱ�����
echo .�޸�������
echo .ȥ�������ڶ���
echo .�Զ��Ż�build.prop
echo .�滻��һ��Բ���Ϳ�������
echo .���AicBootFix�������ȴģʽ
echo .�ں����init.d�ű�֧�� 
echo .����������ʾ���棬������ʾ����ϸ��
echo .ȥ��ǿˢrecovery ���򲿷�ϵͳapk�ļ�
echo .���г��������zipalign�Ż������������
echo .�����MtkTweak_V14����лcx9208�ṩ�˽ű���
echo --------------------------------------------------------
echo ������������˵�
pause>nul
cls
goto CHO

:ODEX
cls
echo.
echo odex�Ż�ʱ��ϳ� �����ĵȴ�
ping 127.0.0.1 -n 2 >NUL
md buding\odex\make\romdir\system\app
md buding\odex\make\romdir\system\framework
xcopy  /e/I/h/r/y/s "suda\system\app" "buding\odex\make\romdir\system\app"
xcopy  /e/I/h/r/y/s "suda\system\framework" "buding\odex\make\romdir\system\framework"
cd buding\odex
call "start.bat"
cd..
cd..
rd /s /q suda\system\app
rd /s /q suda\system\framework
md suda\system\app
md suda\system\framework
xcopy /e/I/h/r/y/s "buding\odex\make\romdir\system" "suda\system" 
rd /s /q buding\odex\make\romdir\system\app
rd /s /q buding\odex\make\romdir\system\framework
cls
echo.
echo �ϲ���ɣ������������˵�
ping 127.0.0.1 -n 2 >NUL
goto CHO




