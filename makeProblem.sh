#!/usr/bin/env bash
#
# This code create a folder for a code eval problem with a make file
# and the org file for the scores
# Programmed by: Carlos Montilla

echo "Enter the name of the problem: "
read problemName

if [ "$problemName" == "" ]; then
   echo "Error! The problem has to have a non-empty name"
   exit 1
fi

echo "Enter the code of the problem [Optional]: "
read problemCode
