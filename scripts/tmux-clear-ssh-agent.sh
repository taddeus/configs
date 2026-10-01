#!/usr/bin/env bash
# Wipe the keys after a specified delay, unless there are still tmux clients
# attached.
set -e
#exec > >(tee -a /tmp/tmux-timer.log) 2>&1
sleep "${1-0}"
if [ $(tmux list-clients | wc -l) -eq 0 ]; then
    export SSH_AUTH_SOCK="/run/user/$(id -u)/openssh_agent"
    exec ssh-add -D
fi
