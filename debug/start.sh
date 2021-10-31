#!/bin/bash 

nohup gdbserver 192.168.8.231:1234 "../redis-server" "redis-cluster-8000.conf" >>"/tmp/8000.log" 2>&1 &
nohup gdbserver 192.168.8.231:1235 "../redis-server" "redis-cluster-8001.conf" >>"/tmp/8001.log" 2>&1 &
nohup gdbserver 192.168.8.231:1236 "../redis-server" "redis-cluster-8002.conf" >>"/tmp/8002.log" 2>&1 &
