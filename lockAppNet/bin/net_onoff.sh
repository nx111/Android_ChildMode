#!/system/bin/sh

netlock=`getprop android.network.lockAppNet`
[  "$netlock" = "" ]  && netlock="1"
if [ "$netlock" = "0" ]; then
   setprop android.network.lockAppNet 1
   setprop android.lockAppNet.offtime ""
   echo "...... enable lockAppNet......"
else
   setprop android.network.lockAppNet 0
   setprop android.lockAppNet.offtime `date +%s`
   echo "...... disable lockAppNet......"
fi

[ -x /system/bin/lockAppNet -a "$(getprop android.lockAppNet.pid)" = "" ] && /system/bin/lockAppNet

