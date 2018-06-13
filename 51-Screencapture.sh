#!/bin/bash

#############################################
#                                           
# Author: Jason K
# Purpose: ScreenCapture Prototype
# FileName: 51-Screencapture.sh
# Created: 06/08/2018 
# Modifed: 06/12/2018
#                                           
############################################


while true
do
	dirPath=~/Pictures/51-Screenshots/
	minute=$(date +%M)
	hour=$(date +%H)
	date=$(date +%d)
	month=$(date +%m)
	year=$(date +%Y)
# Formatting for Directories & Files based on dates & times
	monthDirPath=$dirPath$year-$month
	fileName=$(date +%Y-%m-%d-%H%M)

# Creates main directory called '51-Screenshots' if it does not exist
function dirMain() {
	if [ ! -d $dirPath ]
		then
			mkdir $dirPath
	fi
}

# Creates subDirectory based upon the month if it does not exist
function dirMonth() {
	if [ ! -d $monthDirPath ]
		then
			mkdir $monthDirPath
	fi
}

# Creates subDirectory based upon pay period if it does not exist
function dirPayPeriod() {
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
	# Creating whole path to the file in one variable
	fullPathToFile=$subDirPath/$fileName
}

# Screencapture time controller
function shotCaller() {
	if [ $minute == $2 ]
		then
			screencapture $1
	fi
}
#############
# NOTE: shotcaller() should be changed to gui controlled interface for 
#  starting & stopping of screencaptures & customizations when rewritten 
#  in python or swift
#############

# Calling functions
	dirMain
	dirMonth
	dirPayPeriod
	shotCaller $fullPathToFile $1 
#### Need to reset $1 to a time rather than simply receive input ####

##############
# gzip
#		automate gzip of directories 
#		provide ungzip functionality 
'''
GZIP-->
=$
zipTime=$month+$
if [ $zipTime == 

'''
	sleep 60
done

###############
# This is here for reference 
#--->	default write com.apple.screencapture location $subDirPath name $currentDateTime type $JpgTiffGifPdfPng
#---> killall SystemUIServer
#---> default delete com.apple.screencapture location

################
#---> default location script prototype...
# read -p "Would you like to restore screencapture location to default? (y)" restore
# if [ restore == "y" ]
#		then
#			defaults write com.apple.screencapture location ~/Desktop/
#			killall SystemUIServer
#			echo "Screencapture location returned to Desktop."
#		else
#			echo "Screencapture location unchanged."
#	fi

