#!/bin/csh -f


echo Drag a file to check size :
set p = $<
if(-e $p) then
	echo file exist
	echo -n size (in bytes) =
	stat -f '%z' $p
	echo name = $p:t
	rm $p
else
	echo file does not exist
endif
chmod +x exp.sh
sleep 10s
