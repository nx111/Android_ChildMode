#!/system/bin/sh

netlock=`getprop android.network.lockAppNet`
[  "$netlock" = "" ]  && netlock="1"
if [ "$netlock" = "0" ]; then
   setprop android.network.lockAppNet 1
   echo "...... enable lockAppNet......"
else
   setprop android.network.lockAppNet 0
   echo "...... disable lockAppNet......"
fi
[ -x /system/bin/lockAppNet ] && /system/bin/lockAppNet
