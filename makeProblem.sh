#!/usr/bin/env bash
#
# This code create a folder for a code eval problem with a make file
# and the org file for the scores
# Programmed by: Carlos Montilla

echo "Enter the level of the problem:"
echo "1: easy"
echo "2: Medium"
echo "3: Hard"
read problemLevel

if [ $problemLevel -lt 1 ] || [ $problemLevel -gt 3 ]; then
    echo "Error! Invalid problem level"
    exit 1
fi

echo "Enter the name of the problem: "
read problemName

if [ "$problemName" == "" ]; then
   echo "Error! The problem has to have a non-empty name"
   exit 1
fi

echo "Enter the code of the problem [Optional]: "
read problemCode


if [ "$problemCode" = "" ]; then
    problemUrl=unknown
else
    problemUrl="https://www.codeeval.com/open_challenges/"$problemCode
fi
echo $problemUrl
