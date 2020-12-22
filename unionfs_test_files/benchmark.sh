#!/bin/bash
layers=$1

#Shared directory tests
python3 /unionfs_benchmark/data/read_write_benchmark.py /unionfs_benchmark/data/input_file\
								/unionfs_benchmark/data/output_file\
								/unionfs_benchmark/data/input_file_small\
								/unionfs_benchmark/data/output_file_small\
								/unionfs_benchmark/data/results_mount.csv
rm /unionfs_benchmark/data/output_file
rm /unionfs_benchmark/data/output_file_small_0
rm /unionfs_benchmark/data/output_file_small_1
rm /unionfs_benchmark/data/output_file_small_2
rm /unionfs_benchmark/data/output_file_small_3
rm /unionfs_benchmark/data/output_file_small_4
rm /unionfs_benchmark/data/output_file_small_5
rm /unionfs_benchmark/data/output_file_small_6
rm /unionfs_benchmark/data/output_file_small_7
rm /unionfs_benchmark/data/output_file_small_8
rm /unionfs_benchmark/data/output_file_small_9
rm /unionfs_benchmark/data/output_file_small_10

#Layer tests
for layer in 0 $layers
do
	python3 /unionfs_benchmark/data/read_write_benchmark.py /unionfs_benchmark/layer_$layer/input_file\
								/unionfs_benchmark/layer_$layer/output_file\
								/unionfs_benchmark/layer_$layer/input_file_small\
								/unionfs_benchmark/layer_$layer/output_file_small\
								/unionfs_benchmark/data/results_layer_${layer}_${layers}.csv
	#Remove the files we wrote to, since they have been copied and now are taking up space
	rm /unionfs_benchmark/layer_$layer/output_file
	rm /unionfs_benchmark/layer_$layer/output_file_small_0
	rm /unionfs_benchmark/layer_$layer/output_file_small_1
	rm /unionfs_benchmark/layer_$layer/output_file_small_2
	rm /unionfs_benchmark/layer_$layer/output_file_small_3
	rm /unionfs_benchmark/layer_$layer/output_file_small_4
	rm /unionfs_benchmark/layer_$layer/output_file_small_5
	rm /unionfs_benchmark/layer_$layer/output_file_small_6
	rm /unionfs_benchmark/layer_$layer/output_file_small_7
	rm /unionfs_benchmark/layer_$layer/output_file_small_8
	rm /unionfs_benchmark/layer_$layer/output_file_small_9
	rm /unionfs_benchmark/layer_$layer/output_file_small_10
done