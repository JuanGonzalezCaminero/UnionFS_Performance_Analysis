import sys
import time
import os

if len(sys.argv)<3:
	print("Usage: create_file.py <filename> <size in MiB>")
	exit()

file = open(sys.argv[1], 'wb')
size = int(sys.argv[2])

start=time.clock_gettime(time.CLOCK_REALTIME)
for i in range(size):
	#Each MiB can fit 1048576 bytes
	##file.write(bytes(1048576))
	file.write(os.urandom(1048576))
file.close()

end=time.clock_gettime(time.CLOCK_REALTIME)

print("Time: "+str(end-start))
print("Resolution: "+str(time.clock_getres(time.CLOCK_REALTIME))+"s")