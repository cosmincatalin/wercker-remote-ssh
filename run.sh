#!/bin/bash

# Save current IFS
SAVEIFS=$IFS
# Change IFS to new line. 
TST="$WERCKER_REMOTE_SSH_COMMANDS"
TST=$(echo "$TST" | sed -r 's/\\n/'$WERCKER_REMOTE_IFS'/g')
IFS=$WERCKER_REMOTE_IFS
read -r -a commands <<< "$TST"
# Restore IFS
IFS=$SAVEIFS
for (( i=0; i<${#commands[@]}; i++ ))
do
    if [ -n "${commands[$i]}" ]; then
        echo ">>>${commands[$i]}"
        ssh -o "StrictHostKeyChecking no" $WERCKER_REMOTE_SSH_USER@$WERCKER_REMOTE_SSH_IP ${commands[$i]}
    fi
done
