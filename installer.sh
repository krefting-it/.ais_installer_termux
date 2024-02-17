#!/bin/bash

# Suche nach dem Archiv mit der Endung .ais im aktuellen Verzeichnis
ais_file=$(find . -maxdepth 1 -type f -name "*.ais")

if [ -z "$ais_file" ]; then
    echo "Keine .ais-Datei im aktuellen Verzeichnis gefunden."
    exit 1
fi

# Entpacke das Archiv
unzip "$ais_file"

# Suche nach der APK-Datei im entpackten Verzeichnis
apk_file=$(find . -type f -name "*.apk")

if [ -z "$apk_file" ]; then
    echo "Keine APK-Datei im Archiv gefunden."
    exit 1
fi

# Installiere die APK-Datei
adb install "$apk_file"

echo "APK-Datei erfolgreich installiert."
exit 0