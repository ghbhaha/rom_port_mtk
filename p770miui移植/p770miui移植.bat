:top
cls
@echo off
title p770 miui 移植 by suda
color 1e
mode con cols=58 lines=30
:MENU
cls
echo --------------------------------------------------------
@echo ********************************************************
@echo               p770 miui移植 by suda
@echo                    QQ:510146422  
@echo                      外发版
@echo ********************************************************
echo.                             %date% %time%
echo --------------------------------------------------------
echo .使用前最好查阅说明
echo .仅供学习交流 
echo .如果大家支持我,可以下载推广软件,安装联网点击激活（无扣费软件）
echo .请不要修改文件夹和文件名 否则工具将无法运行
echo --------------------------------------------------------
echo   1.下载v970miui包  
echo   2.下载推广软件  
echo   3.一键移植  
echo   4.查看说明
echo   5.退出程序
echo --------------------------------------------------------

:CHO
set choice=
set /p choice= 选择你要进行的操作:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto DOW
if /i "%choice%"=="2" goto DOW2
if /i "%choice%"=="3" goto CHO1
if /i "%choice%"=="4" goto HELP
if /i "%choice%"=="5" EXIT
echo 选择无效，请重新输入
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
echo 教程：
echo .请将v970_miui刷机包放到rom文件夹
echo .点击p770miui移植工具.bat 按提示操作 等待制作完成
echo --------------------------------------------------------
echo 按任意键返回上层目录
pause>nul
goto MENU


:CHO1
ping 127.0.0.1 -n 2 >NUL
cls
echo 正在移植,请稍候...... 
echo. 
echo 正在解压,请稍候......  
if not exist rom\*.zip ( echo. 
echo 未发现刷机包，请放到rom文件夹
ping 127.0.0.1 -n 3 >NUL
goto top
) else tools\7z x rom\*.zip -y -orom\ >NUL  
del rom\*.zip
echo.
echo 解压完成......
ping 127.0.0.1 -n 2 >NUL  
echo.
echo 正在应用补丁......
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

rem 呼吸灯
rem tools\7z a rom\system\app\Settings.apk .\rom\system\app\res
rem rd /s /q rom\system\app\res


:射频优化 添加otg
tools\7z a rom\system\framework\framework-res.apk .\rom\system\framework\res >NUL
rd /s /q rom\system\framework\res

@echo -------------------------------------------------------
@echo 请选择是否继续zipalign优化
@echo 1.不了
@echo 2.继续优化
set /p c=  请选择:
if %c%==1 goto END
if %c%==2 @echo -------------------------------------------------------
@echo zipalign优化中,时间较长，请耐心等候
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
@echo 优化完毕

:END
tools\7z a rom\miui_p770_%date:~3,1%.%date:~5,2%.%date:~8,2%_4.2.zip .\rom\*
@echo -------------------------------------------------------
@echo ********************************************************
@echo                     移植完成
@echo                         谢谢使用
@echo                                            ——By suda
@echo ********************************************************
@echo 请按任意键退出工具
pause>nul
Exit

