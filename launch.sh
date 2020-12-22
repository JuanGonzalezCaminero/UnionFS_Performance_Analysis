#!/bin/bash
#Enable wildcard expansion inside scripts
shopt -s extglob

echo 3 > /proc/sys/vm/drop_caches
for i in {1..5}
do
	#Host only tests
	python3 unionfs_test_files/read_write_benchmark.py unionfs_test_files/input_file\
								unionfs_test_files/output_file\
								unionfs_test_files/input_file_small\
								unionfs_test_files/output_file_small\
								unionfs_test_files/results_host.csv
	rm unionfs_test_files/output*
	echo 3 > /proc/sys/vm/drop_caches

	#Container tests, 10 layers
	docker run -v /mnt/sdb2/UnionFS_Performance_Analysis/unionfs_test_files/:/unionfs_benchmark/data unionfs_tester_10
	echo 3 > /proc/sys/vm/drop_caches

	#Container tests, 20 layers
	docker run -v /mnt/sdb2/UnionFS_Performance_Analysis/unionfs_test_files/:/unionfs_benchmark/data unionfs_tester_20
	echo 3 > /proc/sys/vm/drop_caches

	#Prune containers
	docker container prune -f
done

#Disable wildcard expansion inside scripts (To leave it at its default behaviour)
shopt -u extglob

