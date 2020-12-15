FROM ubuntu
# Install python and pip
RUN apt-get update -y
RUN apt-get install -y python3
#Make some layers
ADD unionfs_test_files /unionfs_benchmark/layer_0
ADD unionfs_empty_layer /unionfs_benchmark/layer_1
ADD unionfs_empty_layer /unionfs_benchmark/layer_2
ADD unionfs_empty_layer /unionfs_benchmark/layer_3
ADD unionfs_empty_layer /unionfs_benchmark/layer_4
ADD unionfs_empty_layer /unionfs_benchmark/layer_5
ADD unionfs_empty_layer /unionfs_benchmark/layer_6
ADD unionfs_empty_layer /unionfs_benchmark/layer_7
ADD unionfs_empty_layer /unionfs_benchmark/layer_8
ADD unionfs_test_files /unionfs_benchmark/layer_9
#Copy benchmarking scripts
COPY benchmark.sh /unionfs_benchmark/benchmark.sh
# Run the benchmark
CMD ["/unionfs_benchmark/benchmark.sh"]
