#!/bin/sh
# net-bilder
#
# runs on directory runs make_all.sh file
# copy the result files to builder_box folder
net_build(){
	echo "FILELIST"
	AR=`arch` 
	echo $AR
	#mkdir "net_build${ar}" 
	while read p
	do
		echo $p
	done < list.net_build
}
checklist(){
	if test -f list.net_build
	then
		echo "Valid list"
		net_build
	else
		echo "No list found"
		exit
	fi
}
if test -f make_all.sh
then
	echo "Valid path"
	checklist
else
	echo "Invalid path"
	exit
fi
exit
