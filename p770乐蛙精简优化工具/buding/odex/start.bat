@echo off
color 1e
echo.
echo ����Android��ܱ���....
mkdir make\temp_framework
xcopy make\romdir\system\framework make\temp_framework /E/Q
copy make\bzip2.dll make\romdir\system\framework
copy make\zip.exe make\romdir\system\framework
copy make\zip32z64.dll make\romdir\system\framework
copy make\bzip2.dll make\romdir\system\app
copy make\zip.exe make\romdir\system\app
copy make\zip32z64.dll make\romdir\system\app
echo.
echo Android��ܱ������
echo.
echo ��ʼ�ϲ�frameworkĿ¼...
for /r make\romdir\system\framework\ %%a in (*.odex) do call framework.bat %%a
echo.
echo.
echo ��ʼ�ϲ�APPĿ¼...
for /r make\romdir\system\app\ %%a in (*.odex) do call apk.bat %%a
echo.
echo. 
echo ɾ��Android��ܱ���....
del make\temp_framework /Q
del make\romdir\system\app\bzip2.dll /Q
del make\romdir\system\app\zip.exe /Q
del make\romdir\system\app\zip32z64.dll /Q
del make\romdir\system\framework\bzip2.dll /Q
del make\romdir\system\framework\zip.exe /Q
del make\romdir\system\framework\zip32z64.dll /Q
echo.
echo. 

