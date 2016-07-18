#!/system/bin/sh
hasOffTo=0
if [ $# -ge 1 ]; then
   if echo $1 | grep -q "[[:digit:]]\{1,2\}:[[:digit:]]\{1,2\}"; then
        local hour=$(echo $1 | cut -d: -f1)
        local minute=$(echo $1 | cut -d: -f2)
        if [ $hour -le 23 -a $minute -le 59 ]; then
            setprop android.lockAppNet.offto $1
            hasOffTo=1
        fi
   fi
fi

netlock=`getprop android.network.lockAppNet`
[  "$netlock" = "" ]  && netlock="1"
if [ "$netlock" = "0" -a $hasOffTo -eq 0 ]; then
   setprop android.network.lockAppNet 1
   setprop android.lockAppNet.offtime ""
   echo "...... enable lockAppNet......"
else
   setprop android.network.lockAppNet 0
   setprop android.lockAppNet.offtime `date +%s`
   echo "...... disable lockAppNet......"
fi
lockAppNetPid=$(getprop android.lockAppNet.pid)
[ "$lockAppNetPid" != "" -a -d /proc/$lockAppNetPid ] && exit
[ -x /system/bin/lockAppNet ] && /system/bin/lockAppNet

