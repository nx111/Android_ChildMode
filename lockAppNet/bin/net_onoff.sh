#!/system/bin/sh

netlock=`getprop android.network.lockAppNet`
[  "$netlock" = "" ]  && netlock=1

if  [  "$netlock" = "1" ]; then
    setprop android.network.lockAppNet 0
else
    setprop android.network.lockAppNet 1
fi

[ -x /system/bin/lockAppNet ] && /system/bin/lockAppNet
