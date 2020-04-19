#!/bin/bash
name="yourxvt"
pid_file="/tmp/$name.id"
if [[ -f $pid_file ]]
then
	pid=$(cat $pid_file)
	window_id=$(xdotool search --pid $pid) 	
	if [[ $(xdotool search --onlyvisible --pid $pid) == "" ]]
	then 
		xdotool windowmap $window_id
	else 
		xdotool windowunmap $window_id
	fi
else
	urxvt -name $name &
	pid=$!
	echo $pid > $pid_file
	wait $pid
	rm $pid_file
fi
