#!/bin/sh -l

files=$(echo $INPUT_REMOTEFILES | tr ";" "\n")
rmCmd=""

for file in $files
do
    $rmCmd += "rm " + $file + "\n"
done

sshpass -p $INPUT_PASSWORD sftp $INPUT_USER@$INPUT_HOST
sftp $INPUT_USER@$INPUT_HOST:$INPUT_WORKINGDIR <<< $rmCmd