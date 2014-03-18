@echo off
color 1e
title suda 乐蛙精简工具
@echo ********************************************************
@echo         p770 lewa精简优化包制作工具v3.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/28
@echo ********************************************************
echo --------------------------------------------------------
echo .使用前最好查阅说明
echo .请尊重作者劳动 转载请注明
echo .精简系统前你可以选择是否进行odex合并
echo .请不要修改文件夹和文件名 否则工具将无法运行
echo --------------------------------------------------------
echo 按任意键开始解包
pause>nul

if exist suda\*.zip (goto :Dec) else cls
echo.
echo 不存在zip文件或者已经解压
echo 即将进入主菜单
ping 127.0.0.1 -n 2 >NUL
goto CHO

:Dec
buding\7z x suda\*.zip  -osuda\ 
del suda\*.zip
echo.
echo 解包完成
echo 即将进入主菜单
ping 127.0.0.1 -n 2 >NUL
goto CHO

:CHO
cls
@echo ********************************************************
@echo         p770 lewa精简优化包制作工具v3.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/28
@echo ********************************************************
echo --------------------------------------------------------
echo --------------------------------------------------------
echo   1.进行odex合并 
echo   2.制作精简包
echo   3.下载最新版乐蛙rom
echo   4.查看说明
echo   5.退出程序
echo --------------------------------------------------------

set choice=
set /p choice= 选择你要进行的操作:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto ODEX
if /i "%choice%"=="2" goto CHO1
if /i "%choice%"=="3" goto DOW 
if /i "%choice%"=="4" goto HELP
if /i "%choice%"=="5" EXIT
echo 选择无效，请重新输入
ping 127.0.0.1 -n 2 >NUL
echo.
goto CHO

:DOW
start http://bbs.lewaos.com/down_detail.php?id=11
goto CHO


:CHO1
cls
@echo ********************************************************
@echo         p770 lewa精简优化包制作工具v3.0 by  suda
@echo                    QQ:510146422  
@echo                     2014/2/28
@echo ********************************************************
echo --------------------------------------------------------
echo --------------------------------------------------------
echo   1.制作精简包(未odex合并)  
echo   2.制作精简包(已odex合并)
echo   3.返回主菜单
echo   4.退出程序
echo --------------------------------------------------------



set choice=
set /p choice= 选择你要进行的操作:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" buding\odex_0.bat
if /i "%choice%"=="2" buding\odex_1.bat
if /i "%choice%"=="3" goto CHO
if /i "%choice%"=="4" EXIT
echo 选择无效，请重新输入
ping 127.0.0.1 -n 2 >NUL
echo.
goto CHO1

:HELP
cls
echo --------------------------------------------------------
echo 说明：
echo .请将乐蛙官方包zip文件置于suda文件夹中
echo .双击精简包制作工具.bat 等待制作完成
echo .解压过程出现(Y)es / (N)o / (A)lways / (S)kip all / A(u)to rename all / (Q)uit?
echo .请输入a后回车
echo .请无视 未找到 *****
echo .制作odex合并版需要配置java环境 请自行百度 odex未合并版则不需要了
echo .时间居中可能一段时间后无法制作 如果开机fc 请至工具更目录替换未修改的SystemUI.apk
echo .呼吸灯功能集成到Mtktweak中 
echo .精简项目可进入buding修改odex_0.bat和odex_1
echo --------------------------------------------------------
echo 更新项目：
echo .新增odex合并功能
echo .生成zip包名字随日期变化
echo .优化gps
echo .更新基带
echo .时间居中
echo .修复呼吸灯
echo .去除开机第二屏
echo .自动优化build.prop
echo .替换了一个圆润耐看的字体
echo .添加AicBootFix，添加冷却模式
echo .内核添加init.d脚本支持 
echo .加入索尼显示引擎，画面显示更新细腻
echo .去除强刷recovery 精简部分系统apk文件
echo .所有程序进行了zipalign优化，提高流畅度
echo .添加了MtkTweak_V14（感谢cx9208提供此脚本）
echo --------------------------------------------------------
echo 按任意键返主菜单
pause>nul
cls
goto CHO

:ODEX
cls
echo.
echo odex优化时间较长 请耐心等待
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
echo 合并完成，即将返回主菜单
ping 127.0.0.1 -n 2 >NUL
goto CHO




