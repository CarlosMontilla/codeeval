#!/usr/bin/env bash
#
# This code create a folder for a code eval problem with a make file
# and the org file for the scores
# Programmed by: Carlos Montilla

echo "Enter the level of the problem:"
echo "1: Easy"
echo "2: Medium"
echo "3: Hard"
read problemLevel

case $problemLevel in
    1) level=easy ;;
    2) level=medium ;;
    3) level=hard ;;
    *) echo "Error! Non valid level code"; exit 1 ;;
esac

echo "Enter the name of the problem: "
read problemName

if [ "$problemName" == "" ]; then
   echo "Error! The problem has to have a non-empty name"
   exit 1
fi

folderName=`echo $problemName | tr '[:upper:]' '[:lower:]' | tr ' ' '-'`


echo "Enter the code of the problem [Optional]: "
read problemCode


if [ "$problemCode" = "" ]; then
    problemUrl=unknown
else
    problemUrl="https://www.codeeval.com/open_challenges/"$problemCode
fi


echo -n "Moving to $level directory..."
cd ./$level
echo "Done!"

echo -n "Making $folderName directory..."
mkdir $folderName
cd $folderName
echo "Done!"

echo -n "Copying files to folder..."
cp ../../templateFolder/* ./
echo "Done!"
