#!/bin/sh

uid=$(id -u)
gid=$(id -g)

usb_drives=$(ls -l /sys/dev/block | awk -F '/' '($6~"usb" && $NF~"sd.." ) {print "/dev/"$NF}')
if [ "$usb_drives" ]
then
    selection=$( \
        lsblk -rno size,name,mountpoint $usb_drives | \
        awk '($1!~"K" && $1!~"M") {printf "%s%8s %12s\n", $2, $1, $3}' | \
        dmenu -l 5 -i -p "USB drives: " \
    )

    if [ "$selection" ]
    then
        partition=$(echo $selection | awk '{print $1}')
        dir=$(echo $selection | awk '{printf "%s(%s)\n", $1, $2}')

        if grep -qs $partition /proc/mounts
        then
            sync
            sudo umount /dev/$partition
            grep -qs $partition /proc/mounts || sudo rm -r /mnt/$dir
        else
            [[ ! -d /mnt/$dir ]] && sudo mkdir /mnt/$dir
            sudo mount -o uid=$uid,gid=$gid /dev/$partition /mnt/$dir
        fi
    fi
else
    echo "No USB drives connected" | dmenu -i -p "USB drives: "
fi
