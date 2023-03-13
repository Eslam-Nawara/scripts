#!/bin/zsh

code_workspace="1: "
firefox_workspace="2: "
music_workspace="3: 🎧"
telegram_workspace="4: "
file_manager_workspace="5: "
video_workspace="6: "
pdf_workspace="7: "
discord_workspace="8: "

Firefox() {
    if [ -z $(xdotool search --class "firefox") ]
    then
        firefox
    else
        i3-msg workspace $firefox_workspace
    fi
}

Okular() {
    if [ -z $(pgrep okular) ]
    then
        okular
    else
        i3-msg workspace $pdf_workspace
    fi
}

Mpv() {
    if [ -z $(pgrep mpv) ]
    then
        kitty --class "mpv" mpv . 
    else
        i3-msg workspace $video_workspace
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

Lf() {
    if [ -z $(xdotool search --class "lf") ]; then
        setsid -f kitty --class "lf" -e lf
	else
		i3-msg workspace $file_manager_workspace
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

MtMpv() {
    i3-msg move container ot workspace $video_workspace
}

MtOkular() {
    i3-msg move container to workspace $pdf_workspace
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

MtLf() {
    i3-msg move container to workspace $file_manager_workspace
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

    "lf") Lf;;
    "mt_lf") MtLf;;

    "code") Code;;
    "mt_code") MtCode;;

    "discord") Discord;;
    "mt_discord") MtDiscord;;

    "okular") Okular;;
    "mt_okular") MtOkular;;
    
    "mpv") Mpv;;
    "mt_mpv") MtMpv;;

esac
