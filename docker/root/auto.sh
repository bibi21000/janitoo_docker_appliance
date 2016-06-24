#!/bin/bash
rm /opt/janitoo/run/*
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
nice -n 19 top -b
/root/shutdown.sh
