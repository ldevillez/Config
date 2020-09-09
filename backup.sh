#!/bin/bash

input="data"
while IFS=" " read -r -a line
do
  if [ -e ${line[1]} ]
  then
    echo "- ${line[0]}"
    rm -rf backup/${line[0]}
    cp ${line[1]} backup/${line[0]} -r
  else
    echo "- ${line[0]} is not present"
  fi
done < "$input"


rm -rf backup/apt
mkdir backup/apt
apt list > backup/apt/list
grep "apt install" /home/westornd/.zsh_history > backup/apt/history
