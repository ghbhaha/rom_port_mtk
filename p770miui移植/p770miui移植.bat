:top
cls
@echo off
title p770 miui ��ֲ by suda
color 1e
mode con cols=58 lines=30
:MENU
cls
echo --------------------------------------------------------
@echo ********************************************************
@echo               p770 miui��ֲ by suda
@echo                    QQ:510146422  
@echo                      �ⷢ��
@echo ********************************************************
echo.                             %date% %time%
echo --------------------------------------------------------
echo .ʹ��ǰ��ò���˵��
echo .����ѧϰ���� 
echo .������֧����,���������ƹ����,��װ�����������޿۷������
echo .�벻Ҫ�޸��ļ��к��ļ��� ���򹤾߽��޷�����
echo --------------------------------------------------------
echo   1.����v970miui��  
echo   2.�����ƹ����  
echo   3.һ����ֲ  
echo   4.�鿴˵��
echo   5.�˳�����
echo --------------------------------------------------------

:CHO
set choice=
set /p choice= ѡ����Ҫ���еĲ���:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto DOW
if /i "%choice%"=="2" goto DOW2
if /i "%choice%"=="3" goto CHO1
if /i "%choice%"=="4" goto HELP
if /i "%choice%"=="5" EXIT
echo ѡ����Ч������������
ping 127.0.0.1 -n 2 >NUL
echo.
goto MENU

:DOW

start http://www.miui.com/getrom-103.html

goto top

:DOW2

start http://pan.baidu.com/s/1mggCZVi

goto top

:HELP
@echo off
color 1e
cls
echo --------------------------------------------------------
echo �̳̣�
echo .�뽫v970_miuiˢ�����ŵ�rom�ļ���
echo .���p770miui��ֲ����.bat ����ʾ���� �ȴ��������
echo --------------------------------------------------------
echo ������������ϲ�Ŀ¼
pause>nul
goto MENU


:CHO1
ping 127.0.0.1 -n 2 >NUL
cls
echo ������ֲ,���Ժ�...... 
echo. 
echo ���ڽ�ѹ,���Ժ�......  
if not exist rom\*.zip ( echo. 
echo δ����ˢ��������ŵ�rom�ļ���
ping 127.0.0.1 -n 3 >NUL
goto top
) else tools\7z x rom\*.zip -y -orom\ >NUL  
del rom\*.zip
echo.
echo ��ѹ���......
ping 127.0.0.1 -n 2 >NUL  
echo.
echo ����Ӧ�ò���......
echo -------------------------------------------------------
rd /s /q rom\META-INF >NUL
del rom\system\app\LatinIME.apk >NUL
rd /s /q rom\system\etc\init.d >NUL
rd /s /q rom\system\etc\firmware >NUL
rd /s /q rom\system\etc\fmr >NUL
rd /s /q rom\system\etc\mddb >NUL
rd /s /q rom\system\lib\modules >NUL
rd /s /q rom\system\vendor\lib >NUL
rd /s /q rom\system\media\images >NUL
rd /s /q rom\system\media\video >NUL
rd /s /q rom\system\tts >NUL
rd /s /q rom\system\res >NUL
rd /s /q rom\system\usr >NUL
del rom\boot.img >NUL
del rom\system\MtkTweakMode >NUL
del rom\system\lib\libchromeview.so >NUL
del rom\system\lib\libgoogle_recognizer_jni_l.so >NUL
tools\7z x tools\system.img  -y -orom\ >NUL  

for %%i in (rom\system\build.prop) do echo ro.build.version.incremental=%date:~3,1%.%date:~5,2%.%date:~8,2%  >>%%i
for %%i in (rom\system\build.prop) do echo windowsmgr.max_events_per_sec=60  >>%%i
for %%i in (rom\system\build.prop) do echo debug.performance.tuning=1  >>%%i
for %%i in (rom\system\build.prop) do echo video.accelerate.hw=1  >>%%i
for %%i in (rom\system\build.prop) do echo debug.sf.hw=1  >>%%i
for %%i in (rom\system\build.prop) do echo dalvik.vm.execution-mode=int:jit  >>%%i
for %%i in (rom\system\build.prop) do echo #Bravia Engine Service  >>%%i
for %%i in (rom\system\build.prop) do echo ro.service.swiqi.supported=true  >>%%i
for %%i in (rom\system\build.prop) do echo persist.service.swiqi.enable=1  >>%%i

rem ������
rem tools\7z a rom\system\app\Settings.apk .\rom\system\app\res
rem rd /s /q rom\system\app\res


:��Ƶ�Ż� ���otg
tools\7z a rom\system\framework\framework-res.apk .\rom\system\framework\res >NUL
rd /s /q rom\system\framework\res

@echo -------------------------------------------------------
@echo ��ѡ���Ƿ����zipalign�Ż�
@echo 1.����
@echo 2.�����Ż�
set /p c=  ��ѡ��:
if %c%==1 goto END
if %c%==2 @echo -------------------------------------------------------
@echo zipalign�Ż���,ʱ��ϳ��������ĵȺ�
@echo off
copy tools\zipalign.exe rom\system\app
cd rom\system\app
md newApp
for /f "delims=" %%i in ('dir *.apk /b') do zipalign.exe -v 4  %%~si  newApp\%%~nxi1
cd newApp
@echo off
ren *.apk1 *.apk
cd ..
del zipalign.exe
cd ..
xcopy  /e/I/h/r/y/s "app\newApp" "app"
rd /s /q app\newAPP
cd ..
cd ..
@echo �Ż����

:END
tools\7z a rom\miui_p770_%date:~3,1%.%date:~5,2%.%date:~8,2%_4.2.zip .\rom\*
@echo -------------------------------------------------------
@echo ********************************************************
@echo                     ��ֲ���
@echo                         ллʹ��
@echo                                            ����By suda
@echo ********************************************************
@echo �밴������˳�����
pause>nul
Exit

