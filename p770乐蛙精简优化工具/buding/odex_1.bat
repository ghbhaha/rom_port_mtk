@echo off
color 1E

@echo ���ھ�����,���Ժ�...                               
@echo off
:����

:other
del suda\scatter.txt
del suda\SEC_VER.txt
del suda\type.txt
del suda\recovery.img

:......................�����б�(��������ϲ�õ���)..........................
:app\*.apk
del suda\system\app\LewaAppStore.apk
del suda\system\app\Exchange2.apk
del suda\system\app\FileManager.apk
del suda\system\app\FaceLock.apk
del suda\system\app\Galaxy4.apk
del suda\system\app\LewaGameCenter.apk
del suda\system\app\HoloSpiralWallpaper.apk
del suda\system\app\HTMLViewer.apk
del suda\system\app\GameCenter.apk
del suda\system\app\GoogleBackupTransport.apk
del suda\system\app\GoogleCalendarSyncAdapter.apk
del suda\system\app\GoogleContactsSyncAdapter.apk
del suda\system\app\GoogleFeedback.apk
del suda\system\app\GoogleLoginService.apk
del suda\system\app\GoogleOta.apk
del suda\system\app\GoogleOtaSysOper.apk
del suda\system\app\GooglePartnerSetup.apk
del suda\system\app\GoogleServicesFramework.apk
del suda\system\app\GoogleTTS.apk
del suda\system\app\LewaLabiSync.apk
del suda\system\app\LatinIME.apk
del suda\system\app\LewaPond.apk
del suda\system\app\LewaPush.apk
del suda\system\app\LewaUpdater.apk
del suda\system\app\LiveWallpapers.apk
del suda\system\app\LiveWallpapersPicker.apk
del suda\system\app\MagicSmokeWallpapers.apk
del suda\system\app\MediaUploader.apk
del suda\system\app\Microbes.apk
del suda\system\app\MtkVideoLiveWallpaper.apk
del suda\system\app\NetworkLocation.apk
del suda\system\app\NoiseField.apk
del suda\system\app\OneTimeInitializer.apk
del suda\system\app\PhaseBeam.apk
del suda\system\app\PicoTts.apk
del suda\system\app\VisualizationWallpapers.apk

:vendor
del suda\system\vendor\operator\app\BaiduMap.apk
del suda\system\vendor\operator\app\GNotes.apk
del suda\system\vendor\operator\app\iReader.apk
del suda\system\vendor\operator\app\VoiceAssistant.apk
del suda\system\vendor\operator\app\huohua_videoplayer.apk
del suda\system\vendor\operator\app\VoiceAssistant.apk
del suda\system\vendor\operator\app\SogouInput.apk


:google
del suda\system\lib\libgcomm_jni.so
del suda\system\lib\libfrsdk.so
del suda\system\lib\libgoogle_recognizer_jni.so
del suda\system\lib\libmicrobes_jni.so
del suda\system\lib\libpatts_engine_jni_api.so
del suda\system\lib\libpicowrapper.so
del suda\system\lib\libspeexwrapper.so
del suda\system\lib\libvideochat_jni.so
del suda\system\lib\libvideochat_stabilize.so
del suda\system\lib\libvorbisencoder.so
del suda\system\lib\libflint_engine_jni_api.so
del suda\system\lib\libfilterpack_facedetect.so
del suda\system\lib\libvoicesearch.so
rd /s /q suda\system\tts
rd /s /q suda\system\res
rd /s /q suda\system\addon.d
rd /s /q suda\system\media\video
rd /s /q suda\system\media\images
rd /s /q suda\system\usr\srec
:......................�����б�(��������ϲ�õ���)..........................

:������ʾ
for %%i in (suda\system\build.prop) do echo windowsmgr.max_events_per_sec=60  >>%%i
for %%i in (suda\system\build.prop) do echo debug.performance.tuning=1  >>%%i
for %%i in (suda\system\build.prop) do echo video.accelerate.hw=1  >>%%i
for %%i in (suda\system\build.prop) do echo debug.sf.hw=1  >>%%i
for %%i in (suda\system\build.prop) do echo dalvik.vm.execution-mode=int:jit  >>%%i
for %%i in (suda\system\build.prop) do echo #Bravia Engine Service  >>%%i
for %%i in (suda\system\build.prop) do echo ro.service.swiqi.supported=true  >>%%i
for %%i in (suda\system\build.prop) do echo persist.service.swiqi.enable=1  >>%%i

xcopy  /e/I/h/r/y/s "buding\suda1" "suda" 
ping 127.0.0.1 -n 2 >NUL
:zipalign
@echo -------------------------------------------------------
@echo zipalign�������Ż���,ʱ��ϳ��������ĵȺ�
@echo off
copy buding\zipalign.exe suda\system\app
cd suda\system\app
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

:��Ƶ�Ż�
buding\7z a suda\system\framework\framework-res.apk .\suda\system\framework\res
rd /s /q suda\system\framework\res

:Backup systemui.apk
copy suda\system\app\SystemUI.apk .

:ʱ�����
buding\7z a suda\system\app\SystemUI.apk .\suda\system\app\res
rd /s /q suda\system\app\res

:���
buding\7z a suda\Lewa_OS5_p770_%date:~2,2%.%date:~5,2%.%date:~8,2%.zip .\suda\*

@echo ********************************************************
@echo                       �������
@echo                         ллʹ��
@echo                                            ����By suda
@echo ********************************************************
@echo �밴������˳�����
pause>nul
Exit