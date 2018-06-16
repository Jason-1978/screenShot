#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: 51-ScreencaptureZip.sh
# Created: 06/15/18 
# Modifed: 

#############################################

##############
# zip
#		automate zip of directories 
#		provide unzip functionality 

function zipOrErase () {
	type="$1"

	read -p "Would you like to $type old directories(y)? " answer

	dirPath=~/Pictures/51-Screenshots/
	currentMonth=$(date +%m)
	currentYear=$(date +%Y)

	if [ "$answer" == "y" ]
		then 
			read -p "How many months back would you like to $type? " offsetMonths
			searchMonth=$(($currentMonth-$offsetMonths))
			searchYear=$currentYear
		if [ $searchMonth -lt 1 ]
			then
				searchMonth=$(($searchMonth+12))
				searchYear=$(($searchYear-1))
		fi
		if [ $searchMonth -lt 10 ]
			then
				searchMonth=0$searchMonth
		fi
		
		monthDirPathToSearch=$dirPath$searchYear-$searchMonth

		if [ "$type" == "archive" ]
			then
				zip -r $monthDirPathToSearch $monthDirPathToSearch
				rm -f $monthDirPathToSearch
		fi
		if [ "$type" == "erase" ]
			then
				rm -f $monthDirPathToSearch
		fi
	fi
}

##### Add automatic deletion of old directories

zipOrErase archive
echo " Hello "
zipOrErase erase

# zip -r outputPath/Name inputPath/Name
# rm -f inputPath/Name # force deletion of directory and all files stored inside of the directory
