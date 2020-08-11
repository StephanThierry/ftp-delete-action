#!/bin/sh -l

files=$(echo $INPUT_REMOTEFILES | tr ";" "\n")

echo "" > rmcmd
if [ "$INPUT_IGNORESSL" -eq "1" ]
then
    echo -e "set ftp:ssl-allow no;" >> rmcmd
fi

echo -e "user $INPUT_USER \"$INPUT_PASSWORD\"" >> rmcmd
echo -e "cd \"$INPUT_WORKINGDIR\"" >> rmcmd
for file in $files
do
    echo -e "mrm \"$file\";\n" >> rmcmd
done
echo -e "quit;\n" >> rmcmd

lftp  ftp://$INPUT_HOST < rmcmd