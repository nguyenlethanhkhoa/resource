#!/bin/bash

if [ ! -d "src" ]; then
   mkdir src
fi

if [ ! -d "data" ]; then
   mkdir data
fi

os_list=(`ls virtual_env`)

echo 'Which OS do you choose ?'

for i in "${!os_list[@]}"; do
  echo "$i. ${os_list[i]}"
done

echo 'Enter the number to choose OS'
read os_index

echo 'Which image do you choose ?'
image_list=(`ls virtual_env/${os_list[$os_index]}`)

for i in "${!image_list[@]}"; do
  echo "$i. ${image_list[i]}"
done

echo 'Enter the number to choose Image'
read image_index

cp virtual_env/${os_list[$os_index]}/${image_list[$image_index]} docker-compose.yml
docker-compose build --no-cache
docker-compose up -d
rm docker-compose.yml
