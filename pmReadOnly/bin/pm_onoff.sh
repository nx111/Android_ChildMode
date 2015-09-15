#!/system/bin/sh

## switch package manager to read-only or not.

pm_readonly=`getprop android.pm.readonly`
if ps | grep -q installd; then
    pm_readonly=0
else
    pm_readonly=1
fi

if [ "${pm_readonly}" = "" -o "${pm_readonly}" = "0" ]; then
    setprop ctl.stop installd
    setprop android.pm.readonly 1
    echo "PackageMananger in ReadOnly mode now."
else
    setprop ctl.start installd
    setprop android.pm.readonly 0
    echo "PackageMananger in Normal mode now."
fi

exit 0
