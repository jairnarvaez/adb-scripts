#!/bin/bash

focus_scrcpy() {
    # Obtener el workspace donde está scrcpy
    workspace=$(hyprctl clients -j | jq -r '.[] | select(.class=="scrcpy") | .workspace.id')
    
    if [ -n "$workspace" ]; then
        hyprctl dispatch workspace "$workspace"
        sleep 0.1  # Pequeña pausa para asegurar el cambio
    fi
}

focus_scrcpy

case "$1" in
    whatsapp)
        adb shell am start -n com.whatsapp/.HomeActivity
        ;;
    spotify)
        adb shell am start -n com.spotify.music/.MainActivity
        ;;
    chrome)
        adb shell am start -n com.android.chrome/com.google.android.apps.chrome.Main
        ;;
    youtube)
        adb shell am start -n app.rvx.android.youtube/com.google.android.apps.youtube.app.WatchWhileActivity  	
        ;;
    buffer)
    	adb shell am start -a android.intent.action.VIEW -d "content://com.android.externalstorage.documents/document/primary:Buffer"
    	;;
    *)
        echo "App no reconocida"
        ;;
esac