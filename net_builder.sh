#!/bin/sh
# net-bilder
#
# runs on directory runs make_all.sh file
# copy the result files to builder_box folder
net_build(){
	AR=`arch`
	usr=`whoami`
	loc=`pwd`
	mkdir -p "net_build_${loc##*/}_${AR}" 
	echo "building.."
	while IFP= read -r line
	do
		if test -f $line
		then
			#echo "$line"
			echo "net_build_${loc##*/}_${AR}/${line##*/} SUCCESS"
			cp $line "net_build_${loc##*/}_${AR}/${line##*/}"
		else
			echo "$line FAILED"
		fi
	done < list.net_build
	echo "FINISHED"
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
	echo "net_builder"
	echo "making all.."
	bash make_all.sh
	echo "finished making"
	checklist
else
	echo "error : no make_all.sh found"
	exit
fi
exit
