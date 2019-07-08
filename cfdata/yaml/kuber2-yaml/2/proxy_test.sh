#!/bin/bash

m1=0
m2=0
m3=0

for ((c=1;c<=10000;c++))
do
  RES=$(curl -s http://10.100.0.101)
  #echo $RES

    case $RES in
      *node1*)
        m1=$(($m1+1))
        ;;
      *node2*)
        m2=$(($m2+1))
        ;;
      *node3*)
        m3=$(($m3+1))
        ;;
    esac
done
echo $m1:$m2:$m3
