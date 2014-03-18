@echo off&echo.
color 1e
:MENU
cls
@echo ********************************************************
@echo          a920w lewa移植包制作工具v2.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/23
@echo ********************************************************
echo --------------------------------------------------------
echo .使用前请下载卓普C2乐蛙底包 将zip文件置于suda文件夹
echo .本工具基于卓普C2乐蛙包制作 基于其他包未经测试
echo .请不要修改文件夹和文件名 否则工具将无法运行
echo .请尊重原作者劳动 转载请注明出处
echo --------------------------------------------------------

echo --------------------------------------------------------
echo   1.下载C2乐蛙rom
echo   2.制作A920W乐蛙rom
echo   3.退出程序
echo --------------------------------------------------------

:CHO
set choice=
set /p choice= 选择你要进行的操作:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto DOW
if /i "%choice%"=="2" goto MAKE
if /i "%choice%"=="3" exit
echo 选择无效，请重新输入
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
@echo                       制作完成
@echo                         谢谢使用
@echo                                            ——By suda
@echo ********************************************************
@echo 请按任意键退出工具
pause>nul
Exit

:END

