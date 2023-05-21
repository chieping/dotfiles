#!/usr/bin/env bash
info=($(RotateDisplay | grep 'DELL U2720Q' | awk '{print $1, $4}' | tr -d °))
desired_rotation=$(expr 90 - ${info[1]})
env RotateDisplay ${info[0]} $desired_rotation
