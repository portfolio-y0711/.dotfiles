#!/bin/bash

/usr/local/bin/vboxmanage startvm jenkins --type headless

/usr/local/bin/vboxmanage startvm gitlab --type headless

sleep 1

ssh -tt root@gitlab gitlab-ctl start

sleep 1

/usr/local/bin/vboxmanage startvm agent --type headless

/usr/local/bin/vboxmanage startvm stage --type headless

#/usr/local/bin/vboxmanage startvm docker-registry --type headless
