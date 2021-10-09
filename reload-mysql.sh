#! /bin/sh

set -x
systemctl daemon-reload; sleep 1; 
service mysql stop; sleep 1;
service mysql start;
service mysql status;
