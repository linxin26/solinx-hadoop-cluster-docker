#!/bin/bash

# the default node number is 3
N=${1:-3}
# start hadoop master container
docker rm -f solinx-hadoop-master &> /dev/null
echo "start hadoop-master container..."
docker run -itd \
                --net=solinx-hadoop \
                -p 10070:50070 \
                -p 8088:8088 \
                --name solinx-hadoop-master \
                --hostname solinx-hadoop-master \
                solinx/hadoop:0.1 &> /dev/null

# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	docker rm -f solinx-hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	docker run -itd \
	                --net=solinx-hadoop \
	                --name solinx-hadoop-slave$i \
	                --hostname solinx-hadoop-slave$i \
	                solinx/hadoop:0.1 &> /dev/null
	i=$(( $i + 1 ))
done