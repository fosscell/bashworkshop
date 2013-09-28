#!/bin/bash -xv
timer () 
{ 
    local N=$(($1*60));
    shift;
    ( sleep $N && zenity --info --title="Time's Up" --text="${*:-Times up boy :( $1 minute over}" ) & echo "timer set for $1 minutes"
}

