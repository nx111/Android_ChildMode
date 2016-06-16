#!/sbin/sh
# 

. /tmp/backuptool.functions

list_files() {
cat <<EOF
bin/lockAppNet
bin/net_onoff.sh
addon.d/80-lockAppNet.sh
etc/lockAppNet.conf
etc/crontabs
etc/crontabs/lockAppNet
etc/crontabs/lockAppNet/root
etc/init.d/02lockAppNet
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
