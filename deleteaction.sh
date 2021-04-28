#!/bin/bash -l
files=`echo $INPUT_REMOTEFILES | sed 's/ *$//g'`
dirs=`echo $INPUT_REMOTEDIRECTORIES | sed 's/ *$//g'`

files=$(echo $files | tr ";" "\n")
dirs=$(echo $dirs | tr ";" "\n")

echo "" > rmcmd
if [ "$INPUT_IGNORESSL" -eq "1" ]
then
    echo -e "set ftp:ssl-allow no;" >> rmcmd
fi

echo -e "user $INPUT_USER \"$INPUT_PASSWORD\"" >> rmcmd
echo -e "cd \"$INPUT_WORKINGDIR\"" >> rmcmd

if [ -n "$INPUT_REMOTEFILES" ]; then
  for file in $files
    do
        echo -e "mrm -f \"$file\"; 2>/dev/null \n" >> rmcmd
    done
fi

if [ -n "$INPUT_REMOTEDIRECTORIES" ]; then
    for dir in $dirs
    do
        echo -e "rm -f -r \"$dir\"; 2>/dev/null \n" >> rmcmd
    done
fi 

echo -e "quit;\n" >> rmcmd

lftp  ftp://$INPUT_HOST < rmcmd
