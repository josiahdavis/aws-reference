#!/bin/bash

# Turn off odd-numbered threads on EC2 to effectively disable hyperthreading
for cpu in $(seq 1 2 `nproc`);
do
echo 0 | sudo tee  /sys/devices/system/cpu/cpu${cpu}/online
done
