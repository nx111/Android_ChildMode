#!/system/bin/sh

netlock=`getprop android.network.lockAppNet`
[  "$netlock" = "" ]  && setprop android.network.lockAppNet 0


[ -x /system/bin/lockAppNet ] && /system/bin/lockAppNet
