echo "Nothing Phone (1) Flash All Script - v0.1"
echo "By Sam Victor, Forked from re-index.github.io"

fastboot set_active a
echo Flashing Slot A. Please wait...
fastboot flash boot .\boot.img
fastboot flash abl .\abl.img
fastboot flash aop .\aop.img
fastboot flash bluetooth .\bluetooth.img
fastboot flash cpucp .\cpucp.img
fastboot flash devcfg .\devcfg.img
fastboot flash dsp .\dsp.img
fastboot flash dtbo .\dtbo.img
fastboot flash featenabler .\featenabler.img
fastboot flash hyp .\hyp.img
fastboot flash imagefv .\imagefv.img
fastboot flash keymaster .\keymaster.img
fastboot flash mdtp .\mdtp.img
fastboot flash modem .\modem.img
fastboot flash multiimgoem .\multiimgoem.img
fastboot flash qupfw .\qupfw.img
fastboot flash qweslicstore .\qweslicstore.img
fastboot flash shrm .\shrm.img
fastboot flash uefisecapp .\uefisecapp.img
fastboot flash tz .\tz.img
fastboot flash vbmeta .\vbmeta.img
fastboot flash vbmeta_system .\vbmeta_system.img
fastboot flash vendor_boot .\vendor_boot.img
fastboot flash xbl .\xbl.img
fastboot flash xbl_config .\xbl_config.img
fastboot flash super .\super.img
fastboot reboot
echo Slot A Flash done. 
delay 5
clear
adb devices
adb reboot bootloader
fastboot devices
fastboot set_active b
echo Flashing slot B...
fastboot flash boot .\boot.img
fastboot flash abl .\abl.img
fastboot flash aop .\aop.img
fastboot flash bluetooth .\bluetooth.img
fastboot flash cpucp .\cpucp.img
fastboot flash devcfg .\devcfg.img
fastboot flash dsp .\dsp.img
fastboot flash dtbo .\dtbo.img
fastboot flash featenabler .\featenabler.img
fastboot flash hyp .\hyp.img
fastboot flash imagefv .\imagefv.img
fastboot flash keymaster .\keymaster.img
fastboot flash mdtp .\mdtp.img
fastboot flash modem .\modem.img
fastboot flash multiimgoem .\multiimgoem.img
fastboot flash qupfw .\qupfw.img
fastboot flash qweslicstore .\qweslicstore.img
fastboot flash shrm .\shrm.img
fastboot flash uefisecapp .\uefisecapp.img
fastboot flash tz .\tz.img
fastboot flash vbmeta .\vbmeta.img
fastboot flash vbmeta_system .\vbmeta_system.img
fastboot flash vendor_boot .\vendor_boot.img
fastboot flash xbl .\xbl.img
fastboot flash xbl_config .\xbl_config.img
fastboot flash super .\super.img
fastboot reboot
echo "Done Flashing! You Phone should now reboot into NothingOS 2.0.2"
pause