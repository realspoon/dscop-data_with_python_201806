#!/bin/bash
# chek trap usage and the weakness of "set -e"
set -e

#input value
#$1 base size which search files to delete
#$2 existence date

#input value validation
#MAKE CODES

#set dir
basedir="/ML_UNL/k8s/user/Backup/delete_target" #basedir to save the list and target directory
cd $basedir

#make a list file to delete or move
find /MN_UNL/k8s/user/201*/*/data -size +${1}M -mtime +${2} > ./$(date +%Y%m%d)_${1}M_${2}D.txt

#exec list
exec $(date +%Y%m%d)_${1}M_${2}D.txt

#make a directory
mkdir -p $(date +%Y%m%d)

while read line
do
  #check input value
  source=${line}
  echo "source: $source"

  #make target values to make a command
  target_file="./"$(date +%Y%m%d)$(echo ${source} |sed 's/\/ML_UNL\/k8s\/user//g')
  target_dir=$(dirname $target_file)
  echo "target_file: $target_file"
  echo "target_dir: $target_dir"

  #make a directory
  mkdir -p $target_dir

  #mv option
  #mv -f $source $target_dir
  #cp option
  cp -f $source $target_dir
done
