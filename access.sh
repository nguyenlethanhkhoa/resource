#!/bin/bash

running_list=(`docker ps --format '{{.Names}}'`)

for ((i=0; i < ${#running_list[@]}; i++))
do
  echo "$i. ${running_list[i]}"
done

echo 'Enter the number to choose container'
read running_idx

docker exec -it ${running_list[$running_idx]} bash