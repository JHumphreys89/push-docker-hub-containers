#!/bin/bash

# A script to mimic random VM activity by generating logs.
while true
do
    echo "Mimicking VM activity: A critical application has started."
    sleep 5
    echo "Mimicking VM activity: A routine backup completed successfully. Status: OK"
    sleep 3
    echo "Mimicking VM activity: CPU usage is at $(shuf -i 10-99 -n 1)%."
    sleep 10
    echo "Mimicking VM activity: Network throughput is normal."
    sleep 7
    echo "Mimicking VM activity: Disk space is at $(shuf -i 20-80 -n 1)% of capacity."
    sleep 4
done
