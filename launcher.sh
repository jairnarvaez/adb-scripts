#!/bin/bash

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