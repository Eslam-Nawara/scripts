#!/bin/zsh

ranger_workspace="5: "
firefox_workspace="2: "
telegram_workspace="4: "
code_workspace="1: "
discord_workspace="7: "
music_workspace="3: 🎧"

Firefox() {
    if [ -z $(xdotool search --class "firefox") ]
    then
        firefox
    else
        i3-msg workspace $firefox_workspace
    fi
}

Telegram() {
    if [ -z $(pgrep telegram) ]
    then
        telegram-desktop
    else
        i3-msg workspace $telegram_workspace
    fi
}

Discord() {
    if [ -z $(pgrep Discord) ]
    then
        discord
    else
        i3-msg workspace $discord_workspace
    fi
}

Ranger() {
    if [ -z $(pgrep ranger) ]
    then
        kitty --class "ranger" ranger
    else
        i3-msg workspace $ranger_workspace
    fi
}

Spotify() {
    if [ -z $(pgrep spotify) ]
    then
        LD_PRELOAD=/usr/lib/spotify-adblock.so spotify
    else
        i3-msg workspace $music_workspace
    fi
}

Anghami() {
    if [ -z $(xdotool search --class "anghami") ]
    then
        firefox --new-instance -P anghami --class=anghami https://play.anghami.com/home
    else
        i3-msg workspace $music_workspace
    fi
}

Code() {
    i3-msg workspace $code_workspace
}

MtFirefox() {
    i3-msg move container to workspace $firefox_workspace
}

MtTelegram() {
    i3-msg move container to workspace $telegram_workspace
}

MtMusic() {
    i3-msg move container to workspace $music_workspace
}

MtRanger() {
    i3-msg move container to workspace $ranger_workspace
}

MtCode() {
    i3-msg move container to workspace $code_workspace
}

MtDiscord() {
    i3-msg move container to workspace $discord_workspace
}

case $1 in
    "firefox") Firefox;;
    "mt_firefox") MtFirefox;;

    "telegram") Telegram;;
    "mt_telegram") MtTelegram;;

    "spotify") Spotify;;
    "mt_music") MtMusic;;

    "anghami") Anghami;;
    "mt_music") MtMusic;;

    "ranger") Ranger;;
    "mt_ranger") MtRanger;;

    "code") Code;;
    "mt_code") MtCode;;

    "discord") Discord;;
    "mt_discord") MtDiscord;;
esac
