#!/sbin/sh
# 

. /tmp/backuptool.functions

list_files() {
cat <<EOF
bin/lockAppNet
bin/net_onoff.sh
addon.d/80-lockAppNet.sh
etc/localtime
etc/lockAppNet.conf
etc/crontabs/lockAppNet
etc/crontabs/lockAppNet/root
etc/zoneinfo/GB
etc/zoneinfo/CET
etc/zoneinfo/GMT
etc/zoneinfo/MST
etc/zoneinfo/MET
etc/zoneinfo/PRC
etc/zoneinfo/Hongkong
etc/zoneinfo/UCT
etc/init.d/02lockAppNetEOF
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
