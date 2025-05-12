#!/bin/sh

pkill mpd
mpd
ls ~/Music/ > ~/Music/main.m3u
shuf ~/Music/main.m3u > ~/Music/shuffled.m3u
mpc load shuffled
