#!/bin/bash

for port in {9590..9599}
do
	printf $port"\t"
	ssh -o HostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=no -p $port 10.10.6.149
done

