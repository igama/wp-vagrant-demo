#!/bin/bash
files=`/usr/bin/find /vagrant/sql/ -type f`
number=${#files[@]};
for dat in $files;
do
	echo $dat >> /vagrant/sql_loaded
	/usr/bin/mysql -uroot -proot < $dat
done
echo "There werer $number files imported";
