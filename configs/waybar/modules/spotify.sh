#!/bin/sh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '♪ {{artist}} ⁝ {{title}}')
  text=$info
elif [[ $class == "paused" ]]; then
  text=$icon
elif [[ $class == "stopped" ]]; then
  text=""
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
