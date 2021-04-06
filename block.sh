#!/bin/bash
  
awk -F: '{ print $1}' /etc/passwd > users.txt
while read p; do
  chsh -s /bin/nologin $p
  pkill -KILL -u $p
done < users.txt