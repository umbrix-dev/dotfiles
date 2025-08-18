#!/bin/bash

function send_notification() {
    volume=$(pamixer --get-volume)
    dunstify -a "changevolume" -u normal -r 9993 \
        -h int:value:"$volume" -i "volume-$1" \
        "Volume: ${volume}%" -t 2000
}

case $1 in
    up)
        pamixer -i 5
        send_notification up
        ;;
    down)
        pamixer -d 5
        send_notification down
        ;;
    mute)
        pamixer -t
        if pamixer --get-mute; then
            dunstify -i "volume-mute" -a "changevolume" -t 2000 -r 9993 -u low "Muted"
        else
            send_notification up
        fi
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        ;;
esac
