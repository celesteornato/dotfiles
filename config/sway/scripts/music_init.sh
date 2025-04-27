#!/bin/sh

mpd
ls ~/Music/ > ~/Music/main.m3u
shuf ~/Music/main.m3u > ~/Music/shuffled.m3u
mpc load shuffled
