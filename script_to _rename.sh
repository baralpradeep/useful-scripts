#!/bin/bash
rm -rf /Users/projects/new-policy
mkdir /Users/projects/new-policy
for i in `find . -maxdepth 1 -type d | sed 's|^./||'`;
do

    for l in `find $i -maxdepth 1 -type d`;
    do
      FILE=$l/azurepolicy.json
      if test -f "$FILE"; then
         FILE2=`cat $FILE | jq -r ".[].displayName" |sed 's/ /_/g'`
         if [ -z "$FILE2" ]
          then
            echo $FILE2  "is empty"
          else
            NEW=`echo $i"_"$FILE2`.json
            mv $FILE  /Users/projects/new-policy/$NEW
         fi

      fi
   done

done
