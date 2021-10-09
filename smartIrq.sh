#!/bin/bash

set -x

# INET_NAME='enp125s0f0'
INET_NAME='7d:00.0'
FIRST_CORE=0

irq_list=(`cat /proc/interrupts | grep ${INET_NAME} | awk -F: '{print $1}'`)
cpunum=${FIRST_CORE}  # 修改为所在node的第一个Core

for irq in ${irq_list[@]}
do
echo ${irq} ${cpunum}
echo ${cpunum} > /proc/irq/$irq/smp_affinity_list
echo `cat /proc/irq/$irq/smp_affinity_list`
(( cpunum+=1 ))
done
