#! /bin/sh

set -x

TABLES=${TABLES:-64}
TABLE_SIZE=${TABLE_SIZE:-2000000}

echo "WARMING UP ... ...seconds counting down"
numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306   \
 --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 \
 --distinct-ranges=1    --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100   \
 --time=60 --events=0 --report-interval=12 \
 --tables=${TABLES} --table-size=${TABLE_SIZE} \
 --threads=64 \
 /usr/share/sysbench/oltp_read_write.lua run

if [ 1 -eq 1 ]; then
numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306   \
 --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 \
 --distinct-ranges=1    --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100   \
 --time=600 --events=0 --report-interval=60 \
 --tables=${TABLES} --table-size=${TABLE_SIZE} \
 --threads=64 \
 /usr/share/sysbench/oltp_read_write.lua run
fi
