#!/bin/bash
rm /opt/janitoo/pid/*
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
#You must loop here
/bin/bash
