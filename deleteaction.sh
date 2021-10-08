#!/bin/bash -l
fileString=`echo $INPUT_REMOTEFILES | sed 's/ *$//g'`
dirString=`echo $INPUT_REMOTEDIRECTORIES | sed 's/ *$//g'`

files=$(echo $fileString | tr ";" "\n")
dirs=$(echo $dirString | tr ";" "\n")

echo "" > rmcmd
if [ "$INPUT_IGNORESSL" -eq "1" ]
then
    echo -e "set ftp:ssl-allow no;" >> rmcmd
fi

echo -e "user $INPUT_USER \"$INPUT_PASSWORD\"" >> rmcmd
echo -e "cd \"$INPUT_WORKINGDIR\"" >> rmcmd


if [ -n "$fileString" ]; then
  for file in $files
    do
        echo -e "mrm -f \"$file\" 2>/dev/null; \n" >> rmcmd
        echo -e "mrm -f \"$file\" 2>/dev/null; \n"
    done
fi

if [ -n "$dirString" ]; then
    for dir in $dirs
    do
        echo -e "rm -f -r \"$dir\" 2>/dev/null; \n" >> rmcmd
        echo -e "rm -f -r \"$dir\" 2>/dev/null; \n"
    done
fi

echo -e "quit;\n" >> rmcmd

lftp  $INPUT_HOST $INPUT_OPTIONS < rmcmd
