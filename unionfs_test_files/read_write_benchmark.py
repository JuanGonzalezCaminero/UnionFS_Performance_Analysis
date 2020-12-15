import os
import sys
import time

def rw_single(input_path, output_path, results_file):
	input_file=open(input_path, 'rb')
	output_file=open(output_path, 'wb')
	#READ
	start=time.clock_gettime(time.CLOCK_REALTIME)
	data=input_file.read()
	input_file.close()
	end=time.clock_gettime(time.CLOCK_REALTIME)
	results_file.write(str(end-start)+",")

	#WRITE TO NEW FILE
	start=time.clock_gettime(time.CLOCK_REALTIME)
	output_file.write(data)
	output_file.close()
	end=time.clock_gettime(time.CLOCK_REALTIME)
	results_file.write(str(end-start)+",")

	#WRITE TO EXISTING FILE
	output_file=open(input_path, 'wb')
	modified_data=os.urandom(len(data))

	start=time.clock_gettime(time.CLOCK_REALTIME)
	output_file.write(modified_data)
	output_file.close()
	end=time.clock_gettime(time.CLOCK_REALTIME)
	results_file.write(str(end-start)+",")

def rw_multi(input_path, output_path, results_file, num_files):
	data=[]

	#READ
	start=time.clock_gettime(time.CLOCK_REALTIME)
	for i in range(num_files):
		input_file=open(input_path+"_"+str(i), 'rb')
		data.append(input_file.read())
		input_file.close()
	end=time.clock_gettime(time.CLOCK_REALTIME)
	results_file.write(str(end-start)+",")

	#WRITE TO NEW FILE
	start=time.clock_gettime(time.CLOCK_REALTIME)
	for i in range(num_files):
		output_file=open(output_path+"_"+str(i), 'wb')
		output_file.write(data[i])
		output_file.close()
	end=time.clock_gettime(time.CLOCK_REALTIME)
	results_file.write(str(end-start)+",")

	#WRITE TO EXISTING FILE
	modified_data=os.urandom(len(data[0]))

	start=time.clock_gettime(time.CLOCK_REALTIME)
	for i in range(num_files):
		output_file=open(input_path+"_"+str(i), 'wb')
		output_file.write(modified_data)
		output_file.close()
	end=time.clock_gettime(time.CLOCK_REALTIME)
	results_file.write(str(end-start)+",")



if len(sys.argv)<6:
	print("Usage: read_write_benchmark.py <Input file> <Output file> <Input file small> <Output file small> <Results file>")

results_file = open(sys.argv[5], 'a')
results_file.write("\n")
results_file.write("Read time 1GB,Write time 1GB unmodified,Write time 1GB modified,\
					Read time 10*100MB,Write time 10*100MB unmodified,Write time 10*100MB modified,\
					Read time 100MB,Write time 100MB unmodified,Write time 100MB modified\n")

#1GB
rw_single(sys.argv[1], sys.argv[2], results_file)

#100MB*10
rw_multi(sys.argv[3], sys.argv[4], results_file, 10)

#100MB
rw_single(sys.argv[3]+"_10", sys.argv[4]+"_10", results_file)


print("Resolution: "+str(time.clock_getres(time.CLOCK_REALTIME))+"s")

