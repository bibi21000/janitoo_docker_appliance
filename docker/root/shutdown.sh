#!/bin/bash
echo "Halting ..."
killall supervisord
echo "Waiting for shutdown for 15 seconds ..."
[ `ps aux|wc -l` -lt 5 ] && sleep 15
ps aux
echo "Waiting for shutdown for 10 seconds ..."
[ `ps aux|wc -l` -lt 5 ] && sleep 10
ps aux
echo "Killing main processes ..."
killall python 2>/dev/null
killall uwsgi 2>/dev/null
killall ssshd 2>/dev/null
echo "Waiting for shutdown for 10 seconds ..."
[ `ps aux|wc -l` -lt 4 ] && sleep 10
ps aux
echo "Waiting for shutdown for 5 seconds ..."
[ `ps aux|wc -l` -lt 4 ] && sleep 5
ps aux
echo "Waiting for shutdown for 5 seconds ..."
[ `ps aux|wc -l` -lt 3 ] && sleep 5
ps aux
