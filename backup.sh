#!/bin/bash

input="data"
while IFS=" " read -r -a line
do
  path="$HOME/${line[1]}"
  if [ -e "$path" ]
  then
    echo "- ${line[0]}"
    rm -rf backup/${line[0]}
    cp "$path" backup/${line[0]} -r
  else
    echo "- ${line[0]} is not present"
  fi
done < "$input"


rm -rf backup/apt
mkdir backup/apt
apt list > backup/apt/list
grep "apt install" /home/westornd/.zsh_history > backup/apt/history
