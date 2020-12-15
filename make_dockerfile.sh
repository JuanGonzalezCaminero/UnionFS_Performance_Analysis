layers=$1
i=0

echo "FROM ubuntu" > Dockerfile

echo "# Install python and pip" >> Dockerfile
echo "RUN apt-get update -y" >> Dockerfile
echo "RUN apt-get install -y python3" >> Dockerfile

echo "#Make some layers" >> Dockerfile
echo "ADD unionfs_test_files /unionfs_benchmark/layer_$i" >> Dockerfile
for i in $(seq 1 $(expr $layers - 2))
do 
	echo "ADD unionfs_empty_layer /unionfs_benchmark/layer_$i" >> Dockerfile
done
i=$(expr $i + 1)
echo "ADD unionfs_test_files /unionfs_benchmark/layer_$i" >> Dockerfile

echo "#Copy benchmarking scripts" >> Dockerfile
echo "COPY benchmark.sh /unionfs_benchmark/benchmark.sh" >> Dockerfile

echo "# Run the benchmark" >> Dockerfile
echo "CMD [\"/unionfs_benchmark/benchmark.sh\"]" >> Dockerfile