#!/bin/bash
for i in `find . -maxdepth 1 -type d | sed 's|^./||'`;
do
#    cd $i
    DIR=$i
   # echo $DIR
    for l in `find $i -maxdepth 1 -type d`;
    do
      FILE=$l/azurepolicy.json
      if test -f "$FILE"; then
         #echo "$FILE exists."
         #echo "file Name" $FILE
         FILE2=`cat $FILE | jq -r ".[].displayName" |sed 's/ /-/g'`.json
         #FILE2=`echo $l |sed 's/\//-/g'`.json
         echo $FILE2
         mv $FILE  /Users/pradeep.baral/projects/new-policy/$FILE2

      fi
   done

done
