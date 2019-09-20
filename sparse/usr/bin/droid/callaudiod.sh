#!/bin/env bash

# Original script by deathmist
#
# A temporary *very hacky* solution to enable call audio from earpiece and loudspeaker during voice calls.
# To launch (as nemo): "chmod +x callaudiod.sh && ./callaudiod.sh &"
# Requires a custom RPM package for pulseaudio-modules-droid e.g. https://git.io/fjDjt
#
# Oh and yes, Huong Tram is my favorite singer.

# Functions
log() {
  echo "callaudiod: $@"
}

# type=method_call
dbus-monitor interface="org.nemomobile.voicecall.VoiceCallManager" | while read -r line; do
    # e.g.
    # method call time=1563377174.860846 sender=:1.31 -> destination=org.nemomobile.voicecall serial=179 path=/; interface=org.nemomobile.voicecall.VoiceCallManager; member=setAudioMode
    # string "earpiece"
    
    if echo $line | grep "earpiece" > /dev/null; then
        # For this device, voicemode2 seems to be nothing other than low frequency noises
        # and the sound of.. keypads. So both earpiece and speaker uses the same mode.
        log "Switching audio output to earpiece..."
        pactl set-card-profile droid_card.primary voicecall-voicemmode1
    elif echo $line | grep "ihf" > /dev/null; then
        # Call switched to loudspeaker => set voicemode1
        log "Switching audio output to loudspeaker..."
        pactl set-card-profile droid_card.primary voicecall-voicemmode1
    fi
done
