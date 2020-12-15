#!/bin/bash
#Enable wildcard expansion inside scripts
shopt -s extglob

echo 3 > /proc/sys/vm/drop_caches
for i in {1..5}
do
	#Host only tests
	python3 /unionfs_benchmark/data/read_write_benchmark.py /unionfs_benchmark/data/input_file\
								/unionfs_benchmark/data/output_file\
								/unionfs_benchmark/data/input_file_small\
								/unionfs_benchmark/data/output_file_small\
								/unionfs_benchmark/data/results_host.csv
	rm /unionfs_benchmark/data/output*
	#Container tests
	docker run -v /mnt/sdb2/UnionFS_Performance_Analysis/unionfs_test_files/:/unionfs_benchmark/data unionfs_tester
	echo 3 > /proc/sys/vm/drop_caches
done

#Disable wildcard expansion inside scripts (To leave it at its default behaviour)
shopt -u extglob

#Prune containers (Leaving the user to decide wether to do it or not)
docker container prune