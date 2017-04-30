#!/bin/bash

# Save current IFS
SAVEIFS=$IFS
# Change IFS to new line. 
IFS=$'\n'
commands=($WERCKER_REMOTE_SSH_COMMANDS)
# Restore IFS
IFS=$SAVEIFS
for (( i=0; i<${#commands[@]}; i++ ))
do
    echo "$i: ${commands[$i]}"
done

echo $WERCKER_REMOTE_SSH_USER
echo $WERCKER_REMOTE_SSH_IP