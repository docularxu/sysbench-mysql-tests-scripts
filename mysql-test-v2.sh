#! /bin/sh

set -x

TABLES=${TABLES:-64}
TABLE_SIZE=${TABLE_SIZE:-2000000}

if [ 1 -eq 1 ]; then
echo "WARMING UP ... 120 seconds counting down"
numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306   \
 --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 \
 --distinct-ranges=1    --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100   \
 --time=120 --events=0 --report-interval=12 \
 --tables=${TABLES} --table-size=${TABLE_SIZE} \
 --threads=64 \
 /usr/share/sysbench/oltp_read_only.lua run
fi

numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306 \
  --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 --distinct-ranges=1  \
  --delete_inserts=1 \
  --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100 \
  --time=600 --events=0 --report-interval=60 \
  --tables=${TABLES} --table-size=${TABLE_SIZE} \
  --threads=64  \
  /usr/share/sysbench/oltp_write_only.lua run

if [ 1 -eq 0 ]; then
numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306 \
  --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 --distinct-ranges=1  \
  --delete_inserts=1 \
  --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100 \
  --time=600 --events=0 --report-interval=60 \
  --tables=${TABLES} --table-size=${TABLE_SIZE} \
  --threads=32  \
  /usr/share/sysbench/oltp_write_only.lua run

numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306 \
  --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 --distinct-ranges=1  \
  --delete_inserts=1 \
  --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100 \
  --time=600 --events=0 --report-interval=60 \
  --tables=${TABLES} --table-size=${TABLE_SIZE} \
  --threads=16  \
  /usr/share/sysbench/oltp_write_only.lua run

numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306 \
  --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 --distinct-ranges=1  \
  --delete_inserts=1 \
  --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100 \
  --time=600 --events=0 --report-interval=60 \
  --tables=${TABLES} --table-size=${TABLE_SIZE} \
  --threads=8  \
  /usr/share/sysbench/oltp_write_only.lua run

numactl -C 0-63 sysbench --db-driver=mysql --mysql-user=sbtest_user --mysql_password=password --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3306 \
  --point-selects=10 --simple-ranges=1 --sum-ranges=1 --order-ranges=1 --distinct-ranges=1  \
  --delete_inserts=1 \
  --index-updates=1 --non-index-updates=1 --delete-inserts=1  --range-size=100 \
  --time=600 --events=0 --report-interval=60 \
  --tables=${TABLES} --table-size=${TABLE_SIZE} \
  --threads=4  \
  /usr/share/sysbench/oltp_write_only.lua run

fi
