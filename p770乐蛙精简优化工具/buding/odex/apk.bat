@echo off
cd make
echo     正在将 %~n1.odex 转化为 classes.dex ...
java -Xmx512M -jar baksmali.jar -a 17 -d temp_framework -x %1
java -Xmx512M -jar smali.jar out -a 17 -o  romdir\system\app\classes.dex
del %1 /Q
rd out /Q /S
echo     正在将 %~n1.apk 与 classes.dex 合并...
cd romdir\system\app
zip %~n1.apk -u classes.dex>nul
del classes.dex /Q
cd ..\..\..\..\
echo.
echo     ---- Success ----
echo.
