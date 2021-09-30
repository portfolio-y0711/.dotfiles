#!/bin/bash
#. /home/yoonsung0711/.nvm/nvm.sh

ssh -tt root@jenkins shutdown -h now
sleep 1
ssh -tt root@gitlab gitlab-ctl stop
sleep 1
ssh -tt root@gitlab shutdown -h now
sleep 1
ssh -tt root@agent shutdown -h now
sleep 1

(cd /Users/yoonsung0711/git_main/_in_progress/current/2021_microNodejs && yarn stage:stop)
ssh -tt root@stage shutdown -h now
sleep 1
#ssh -tt root@docker-registry shutdown -h now
#sleep 1

