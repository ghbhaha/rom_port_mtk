@echo off
cd make
echo     ���ڽ� %~n1.odex ת��Ϊ classes.dex ...
java -Xmx512M -jar baksmali.jar -a 17 -d temp_framework -x %1
java -Xmx512M -jar smali.jar out -a 17 -o  romdir\system\app\classes.dex
del %1 /Q
rd out /Q /S
echo     ���ڽ� %~n1.apk �� classes.dex �ϲ�...
cd romdir\system\app
zip %~n1.apk -u classes.dex>nul
del classes.dex /Q
cd ..\..\..\..\
echo.
echo     ---- Success ----
echo.
