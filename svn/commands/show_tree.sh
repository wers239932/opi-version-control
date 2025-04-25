#!/bin/sh
svn log -q $SVN_SHOW_PATH/svn/workdir | awk '/^r[0-9]+/ {print $1 "|" $3 "|" $5 " " $6}' | \
while read line; do
    rev=$(echo $line | cut -d'|' -f1)
    author=$(echo $line | cut -d'|' -f2)
    date=$(echo $line | cut -d'|' -f3)
    svn log -v -r $rev | awk '/^   A|^   D|^   M/ {print $2}' | \
    while read path; do
        echo "$rev|$author|$date|$path"
    done
done | column -t -s"|"