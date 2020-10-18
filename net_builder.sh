#!/bin/sh
# net-bilder
#
# runs on directory runs make_all.sh file
# copy the result files to builder_box folder
net_build(){
	echo "net_builder"
	AR=`arch`
	usr=`whoami`
	mkdir -p "net_build_${AR}" 
	while IFP= read -r line
	do
		if test -f $line
		then
			#echo "$line"
			echo "net_build_${AR}/${line##*/}"
			cp $line "net_build_${AR}/${line##*/}"
		else
			echo "$line  :0"
		fi
	done < list.net_build
}
checklist(){
	if test -f list.net_build
	then
		net_build
	else
		echo "error : no list.net_build found"
		exit
	fi
}
if test -f make_all.sh
then
	bash make_all.sh
	checklist
else
	echo "error : no make_all.sh found"
	exit
fi
exit
