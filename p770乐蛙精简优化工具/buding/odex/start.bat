@echo off
color 1e
echo.
echo 创建Android框架备份....
mkdir make\temp_framework
xcopy make\romdir\system\framework make\temp_framework /E/Q
copy make\bzip2.dll make\romdir\system\framework
copy make\zip.exe make\romdir\system\framework
copy make\zip32z64.dll make\romdir\system\framework
copy make\bzip2.dll make\romdir\system\app
copy make\zip.exe make\romdir\system\app
copy make\zip32z64.dll make\romdir\system\app
echo.
echo Android框架备份完成
echo.
echo 开始合并framework目录...
for /r make\romdir\system\framework\ %%a in (*.odex) do call framework.bat %%a
echo.
echo.
echo 开始合并APP目录...
for /r make\romdir\system\app\ %%a in (*.odex) do call apk.bat %%a
echo.
echo. 
echo 删除Android框架备份....
del make\temp_framework /Q
del make\romdir\system\app\bzip2.dll /Q
del make\romdir\system\app\zip.exe /Q
del make\romdir\system\app\zip32z64.dll /Q
del make\romdir\system\framework\bzip2.dll /Q
del make\romdir\system\framework\zip.exe /Q
del make\romdir\system\framework\zip32z64.dll /Q
echo.
echo. 

