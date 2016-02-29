#!/usr/bin/env bash

# Code for testing the solution of a codeeval problem
# Programmed by: Carlos Montilla

filename=main
inputfile=./in
outputfile=./out
resultfile=$1.results

case $1 in
    "cpp") g++ -o cpp.out main.cpp && implementation=compiler;;
    "c") gcc -o c.out main.c && implementation=compiler ;;
    "f90") gfortran -o f90.out main.f90 && implementation=compiler ;;
    "py") implementation=interpreter ;;
    "py3") implementation=interpreter ;;
    "rb") implementation=interpreter ;;
    "sh") implementation=interpreter ;;
    *) echo "Unknown extension!"; exit 1;;
esac

if [ $implementation == compiler ]; then
    ./$1.out $inputfile > $resultfile
else
    ./$filename.$1 $inputfile > $resultfile
fi

nTest=`wc -l < $outputfile`
nResults=`wc -l <$resultfile`

if [ $nTest -ne $nResults ]; then
    echo "ERROR!: Number of results does not match"
    exit 1
fi

diff=`diff -U 0 -w  $outputfile $resultfile | grep -v ^@ | wc -l`

if [ $diff -eq 0 ]; then
    echo "All tests passed"
else
    echo "Tests failed!"
fi
