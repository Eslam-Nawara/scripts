#!/bin/zsh

ranger_workspace="2"
firefox_workspace="3"
telegram_workspace="4"
code_workspace="5"
discord_workspace="7"
spotify_workspace="6"

Firefox() {
    if [ -z $(pgrep firefox) ]
    then
        firefox
    else
        i3-msg workspace $firefox_workspace
        current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
        [[ $current_workspace == $firefox_workspace ]] && i3-msg layout tabbed
    fi
}

Telegram() {
    if [ -z $(pgrep telegram) ]
    then
        telegram-desktop
    else
        i3-msg workspace $telegram_workspace
        current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
        [[ $current_workspace == $telegram_workspace ]] && i3-msg layout tabbed
    fi
}

Discord() {
    if [ -z $(pgrep Discord) ]
    then
        discord
    else
        i3-msg workspace $discord_workspace
        current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
        [[ $current_workspace == $discord_workspace ]] && i3-msg layout tabbed
    fi
}

Ranger() {
    if [ -z $(pgrep ranger) ]
    then
        kitty ranger
    else
        i3-msg workspace $ranger_workspace
        current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
        [[ $current_workspace == $ranger_workspace ]] && i3-msg layout tabbed
    fi
}

Spotify() {
    if [ -z $(pgrep spotify) ]
    then
        LD_PRELOAD=/usr/lib/spotify-adblock.so spotify
    else
        i3-msg workspace $spotify_workspace
        current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
        [[ $current_workspace == $spotify_workspace ]] && i3-msg layout tabbed
    fi
}

Code() {
    # if [ -z $(pgrep code) ]
    # then
    #     code
    # else
    #     i3-msg workspace $code_workspace
    #     current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
    #     [[ $current_workspace == $code_workspace ]] && i3-msg layout tabbed
    # fi
    i3-msg workspace $code_workspace
    # current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).name' | tr -d '"')
    # [[ $current_workspace == $code_workspace ]] && i3-msg layout tabbed
}

MtFirefox() {
    i3-msg move container to workspace $firefox_workspace
}

MtTelegram() {
    i3-msg move container to workspace $telegram_workspace
}

MtSpotify() {
    i3-msg move container to workspace $spotify_workspace
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
    "mt_spotify") MtSpotify;;

    "ranger") Ranger;;
    "mt_ranger") MtRanger;;

    "code") Code;;
    "mt_code") MtCode;;

    "discord") Discord;;
    "mt_discord") MtDiscord;;
esac
