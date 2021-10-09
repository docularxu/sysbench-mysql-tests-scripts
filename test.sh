set -x

if [ 0  -eq 1 ]; then
THREADS=64 ./mysql-test-read-only.sh ; 
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=64 ./mysql-test-read-only.sh;  
sleep 180; 
iostat -xym 10 /dev/sdb 1
fi

THREADS=32 ./mysql-test-read-only.sh ; 
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=32 ./mysql-test-read-only.sh;  
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=16 ./mysql-test-read-only.sh;  
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=16 ./mysql-test-read-only.sh; 
sleep 180; 
iostat -xym 10 /dev/sdb 1

if [ 1 -eq 0 ]; then
THREADS=64 ./mysql-test-write-only.sh ; 
sleep 360; 
iostat -xym 10 /dev/sdb 1
THREADS=64 ./mysql-test-write-only.sh;  
sleep 360; 
iostat -xym 10 /dev/sdb 1
fi

THREADS=32 ./mysql-test-write-only.sh ; 
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=32 ./mysql-test-write-only.sh;  
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=16 ./mysql-test-write-only.sh;  
sleep 180; 
iostat -xym 10 /dev/sdb 1
THREADS=16 ./mysql-test-write-only.sh; 
