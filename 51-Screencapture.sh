#!/bin/bash

#############################################
#                                           
# Author: Jason K
# Purpose: ScreenCapture Prototype
# FileName: 51-Screencapture.sh
# Created: 06/08/18 
# Modifed:                                  
#                                           
############################################

dirPath=~/Pictures/51-Screenshots/

# Time Variables Set
minute=$(date +%M)
hour=$(date +%H)
date=$(date +%d)
month=$(date +%m)
year=$(date +%Y)

# Formatting for Directories & Files based on dates & times
monthDirPath=$dirPath$year-$month
currentDateTime=$year-$month-$date-$hour$minute

function DirMain() {
	# Creates main directory called '51-Talk-Screenshots' if it does not exist
	if [ ! -d $dirPath ]
		then
			mkdir $dirPath
	fi
}

function DirMonth() {
	# Creates subDirectory based upon the month if it does not exist
	if [ ! -d $monthDirPath/ ]
		then
			mkdir $monthDirPath/
	fi
}

function DirPayPeriod() {
	# Creates subDirectory based upon pay period if it does not exist
	if [ $date -lt 16 ]
		then
			subDirPath=$monthDirPath/1-15
			if [ ! -d $subDirPath ]
				then
					mkdir $subDirPath
			fi
		else
			subDirPath=$monthDirPath/16-31
			if [ ! -d $subDirPath ]
				then
					mkdir $subDirPath
			fi
	fi
}

DirMain
DirMonth
DirPayPeriod

# Creating whole path to the file in one variable
fullPathToFile=$subDirPath/$currentDateTime

# Instead I could just automate it and create a name and place each time
screencapture $fullPathToFile

# Send screenshots to correct directory using special name 
#		& then reset screenshot location & name
#		automate screencapture while 51-talk app is on at 5, 20, 35 & 50 minutes after hour

# gzip
#		automate gzip of directories 
#		provide ungzip functionality 



# This is here for reference 
#--->	default write com.apple.screencapture location $subDirPath name $currentDateTime
#---> killall SystemUIServer




