#!/usr/bin/env bash
while read line || [[ -n "$line" ]]; do
    echo "Hello World"
done < $1
