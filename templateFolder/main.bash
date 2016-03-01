while read line || [[ -n "$line" ]]; do
    echo $line
done < $1
