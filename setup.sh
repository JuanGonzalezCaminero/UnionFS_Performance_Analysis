
#Create test files
python3 create_file.py unionfs_test_files/input_file 1000
for i in {0..10}
do
	python3 create_file.py unionfs_test_files/input_file_small_$i 100
done

#Remove old images
docker image rm unionfs_tester_10
docker image rm unionfs_tester_20

#Create Dockerfile for 10 layers
./make_dockerfile.sh 10

#Build image
docker build -t unionfs_tester_10 .

#Create Dockerfile for 20 layers
./make_dockerfile.sh 20

#Build image
docker build -t unionfs_tester_20 .